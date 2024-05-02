# Neovim settings
These are my personal Neovim settings

# Location
- Windows: %LOCALAPPDATA%\nvim
- Linux and macOS: ~/.config/nvim/

# Utilities Install
Telescope recommends the use of RipGrep and FD utilities.
Check if the paths are correct at the top of `nvim-path-setup.ps1` and run it:
```
.\nvim-path-setup.ps1
```

Any wrong path will be printed out to the console and missing paths will be
added to the system.


# Mason Install
While these step can be done without running `nvim` previously, it's recommended
that `nvim` is ran at least once before, so you can check the Lazy setup status
before proceeding.

## clangd

Run:
```
nvim --headless -c "MasonInstall clangd" -c "qa"
```

Alternatively, open nvim and run `:MasonInstall clangd`

## python-lsp-server

Run:
```
nvim --headless -c "PylspInstall wheel pyls-isort python-lsp-black python-lsp-ruff"
```

Unfortunately it's not possible to use `-c "qa"` here, as it won't wait until
all the packages are installed to quit.
Once you get the "Successfully installed" message, press `Ctrl` + `C` to exit.

Alternatively, open nvim and run `:PylspInstall wheel pyls-isort python-lsp-black python-lsp-ruff`
