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
While this step can be done without running `nvim` previously, it's recommended
that `nvim` is ran at least once before this step, so you can check the Lazy
setup status before proceeding.

Run:
```
nvim --headless -c "MasonInstall clangd" -c "qa"
```

Alternatively, open nvim and run `:MasonInstall clangd`
