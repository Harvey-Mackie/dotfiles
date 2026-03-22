# Dotfiles

Personal machine setup managed with [GNU Stow](https://github.com/aspiers/stow). The repo keeps shell config, app config, bootstrap scripts, and macOS defaults in one place so a fresh machine can be rebuilt quickly.

## Repository layout

- `.bash_profile` loads `.bashrc` for login shells.
- `.bashrc` contains bash-specific startup and sources `shell/shared.sh`.
- `.zshrc` contains zsh-specific startup and sources `shell/shared.sh`.
- `shell/` holds shared shell helpers and the local token template.
- `scripts/` contains shell functions that get sourced into the shell.
- `.config/` contains managed app and CLI configuration.
- `macos/` contains macOS defaults scripts and notes.
- `init/` bootstraps notes and code repositories into `~/Documents`.
- `tmux/` vendors tmux plugins used by `.tmux.conf`.

See `.config/README.md`, `init/README.md`, `macos/README.md`, and `tmux/README.md` for folder-specific notes.

## Quick start

```sh
git clone https://github.com/Harvey-Mackie/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

`setup.sh` installs `stow` if needed, symlinks the repo into place, installs dependencies from `.Brewfile`, and can optionally apply macOS defaults.

## Manual setup after bootstrap

1. Copy `shell/tokens.example.sh` to `shell/tokens.sh` and add your local secrets.
2. Restart your shell or run `source ~/.bashrc` / `source ~/.zshrc`.
3. Run `bash macos/defaults.sh` or `./setup.sh --apply-macos-defaults` on macOS.
4. Set the keyboard input source to `British - PC` if you want `Shift + 2` to type `"`.

## Shell loading model

- Put shared aliases, navigation shortcuts, and shell-safe helper functions in `shell/shared.sh`.
- Keep shell-specific prompt and completion setup inside `.bashrc` or `.zshrc`.
- Put reusable interactive functions in `scripts/*.sh`; they are sourced automatically from `shell/shared.sh`.
- Keep `shell/tokens.sh` local-only. The tracked template lives at `shell/tokens.example.sh`.

## Managing packages

The `.Brewfile` is the source of truth for packages, casks, and VS Code extensions. Update it intentionally rather than dumping the full system state.

Install everything from the repo with:

```sh
brew bundle --file ~/dotfiles/.Brewfile
```

## Adding new dotfiles

1. Add the file in the repo using the target home-directory path.
2. Re-run `stow .` from the repo root.
3. Update the closest README if the change affects setup or folder conventions.
4. Commit with a conventional commit message.
