# =============================================================================
# Automatic adjustment of user environment variables
# Felipe Guedes da Silveira
# -----------------------------------------------------------------------------
# A custom version of this script meant for nvim utilities integration with
# the user environment Path variable.
# =============================================================================

# =============================================================================
# Config
# -----------------------------------------------------------------------------
# Just a simple list of the executables and their path to be added to User
# Environment Paths in Windows
# =============================================================================
$Utils = @()
$Utils +=, @("C:\Program Files\7-Zip", "7z.exe")
$Utils +=, @("D:\Util\rg", "rg.exe")
$Utils +=, @("D:\Util\fd", "fd.exe")

# =============================================================================
# Script execution area
# =============================================================================

# Function Based on: https://stackoverflow.com/a/73255509
function Test-IsInEnvPath
{
    param(
        [Parameter(Position=0, Mandatory=$true, HelpMessage="Full directory path to be tested")]
        [ValidateNotNullOrEmpty()]
        [string] $Directory
    )

    # Cache it here, just in case something changes it while we're processing
    $EnvPath = $Env:Path

    # Estimate the column count by counting the num of ; characters - It's fine
    # to overestimate this.
    $ColumnCountEstimate = $EnvPath.Length - $EnvPath.Replace(";", "").Length

    # Generate the header for ConvertFrom-Csv, which needs to have at least as
    # many columns as the expected number of folders from $Env:Path
    $Headers = 0..$ColumnCountEstimate

    # Parse $EnvPath as a CSV record using ";" as the delimiter
    $Obj = ConvertFrom-Csv -Header $Headers -Delimiter ";" -InputObject $EnvPath

    # Extract the array of all the folders that exist in $Env:Path
    #$PathArray = $Obj.PSObject.Properties.Value

    # Create an array of strings, where we will store the folder in $Env:Path
    # without any trailing slashes
    $PathArray = [string[]]@()  # Create an empty string array
    ForEach($Path in $Obj.PSObject.Properties.Value)
    {
        if ($Path -ne $null)
        {
            $PathArray += $Path.TrimEnd('\')
        }
    }

    return $PathArray.Contains($Directory.TrimEnd('\'))
}

# From: https://stackoverflow.com/a/69239861
function Add-Path {
    param(
        [Parameter(Mandatory, Position=0)]
        [string] $LiteralPath,
        [ValidateSet('User', 'CurrentUser', 'Machine', 'LocalMachine')]
        [string] $Scope 
    )

    Set-StrictMode -Version 1; $ErrorActionPreference = 'Stop'

    $isMachineLevel = $Scope -in 'Machine', 'LocalMachine'
    if ($isMachineLevel -and -not $($ErrorActionPreference = 'Continue'; net session 2>$null)) { throw "You must run AS ADMIN to update the machine-level Path environment variable." }  

    $regPath = 'registry::' + ('HKEY_CURRENT_USER\Environment', 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment')[$isMachineLevel]

    # Note the use of the .GetValue() method to ensure that the *unexpanded* value is returned.
    $currDirs = (Get-Item -LiteralPath $regPath).GetValue('Path', '', 'DoNotExpandEnvironmentNames') -split ';' -ne ''

    if ($LiteralPath -in $currDirs) {
        Write-Verbose "Already present in the persistent $(('user', 'machine')[$isMachineLevel])-level Path: $LiteralPath"
        return
    }

    $newValue = ($currDirs + $LiteralPath) -join ';'

    # Update the registry.
    Set-ItemProperty -Type ExpandString -LiteralPath $regPath Path $newValue

    # Broadcast WM_SETTINGCHANGE to get the Windows shell to reload the
    # updated environment, via a dummy [Environment]::SetEnvironmentVariable() operation.
    $dummyName = [guid]::NewGuid().ToString()
    [Environment]::SetEnvironmentVariable($dummyName, 'foo', 'User')
    [Environment]::SetEnvironmentVariable($dummyName, [NullString]::value, 'User')

    # Finally, also update the current session's `$env:Path` definition.
    # Note: For simplicity, we always append to the in-process *composite* value,
    #        even though for a -Scope Machine update this isn't strictly the same.
    $env:Path = ($env:Path -replace ';$') + ';' + $LiteralPath

    Write-Verbose "`"$LiteralPath`" successfully appended to the persistent $(('user', 'machine')[$isMachineLevel])-level Path and also the current-process value."
}

# Check what user inputted paths are valid
$ValidPaths = @()
ForEach($Util in $Utils)
{
    Write-Host -NoNewLine "$($Util[1]) path is "
    if (Test-Path ($Util[0] + "\" + $Util[1]) -PathType Leaf)
    {
        Write-Host -ForegroundColor Green "valid"
        $ValidPaths += $Util[0]
    }
    else
    {
        Write-Host -ForegroundColor Red -NoNewLine "invalid"
        Write-Host -ForegroundColor DarkGray " ($($Util[0])\$($Util[1]))"       
    }
}

# If there are any invalid paths, ask if the user wants to proceed
if ($ValidPaths.Length -ne $Utils.Length)
{
    $title    = 'The path for some of the executables are invalid.'
    $question = 'Add only the valid ones?'
    $choices  = @('&Yes', '&No')
    $decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
    if ($decision -eq 1)
    {
        Write-Host -ForegroundColor Red "`nAction cancelled by the user.`n"
        Exit
    }
}

# Print empty line
Write-Host ""

# Check if every path exists
ForEach($Path in $ValidPaths)
{
    Write-Host -NoNewLine -ForegroundColor DarkGray "$Path"
    Write-Host -NoNewLine " is"
    $Exists = Test-IsInEnvPath $Path
    if (!$Exists)
    {
        Write-Host -ForegroundColor Red -NoNewLine " not"
    }
    else
    {
        Write-Host -ForegroundColor Green -NoNewLine " already"        
    }
    Write-Host -NoNewLine " in "
    Write-Host -ForegroundColor Yellow "Env:Path"

    if (!$Exists)
    {
        Add-Path $Path
    }
}
