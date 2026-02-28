# Dotfiles

This repository manages system configuration files using [GNU Stow](https://github.com/aspiers/stow) for symlink management. Instead of storing dotfiles directly in your home directory, they live in this repository and are symlinked into place.

## What's Included

- **bashrc**: Aliases, starship prompt configuration, vi keybindings, bash environment setup
- **bash_profile**: macOS-specific bash initialization
- **gitconfig**: Git user info, LFS setup, push defaults, credential storage
- **vimrc**: Vim configuration
- **tmux.conf**: Tmux settings with session persistence
- **Brewfile**: Package management dependencies for macOS/Linux
- **scripts/**: Utility shell functions (peek, refresh)
- **shell/**: Environment variables and tokens

# Getting Started

## Quick Start
```sh
# Clone the repository
$ git clone https://github.com/Harvey-Mackie/dotfiles.git ~/dotfiles
$ cd ~/dotfiles

# Install Stow (if not already installed)
$ brew install stow

# Create symlinks for all dotfiles
$ stow .

# Install dependencies from Brewfile
$ brew bundle --global
```

## First Time Setup

1. Create `shell/tokens.sh` with any personal environment variables or secrets
2. Run `stow .` to create symlinks
3. Restart your shell or run `source ~/.bashrc`

## Adding New Dotfiles

1. Place the dotfile in the appropriate location in the repo (e.g., `.config/myapp/config`)
2. Run `stow .` to create the symlink
3. Commit and push

## Tips
## Brewfile

The Brewfile defines all dependencies. It's intentionally not auto-synced with your system—only update it when you intentionally want to change your environment.

To update after installing new packages:
```sh
$ brew bundle dump --describe --force
```

To install from Brewfile:
```sh
$ brew bundle --global
```

## Dependencies

Core tools required:
- `stow`: Manages symlinks
- `starship`: Prompt styling
- `fzf`: Fuzzy finder
- `fd`: Fast file finder
- `bat`: Cat clone with syntax highlighting
- `tmux`: Terminal multiplexer

See `Brewfile` for complete list of dependencies.
