#!/bin/bash

set -euo pipefail

echo "Applying macOS defaults..."

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock mru-spaces -bool false

# Finder
defaults write com.apple.finder AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Screenshots
defaults write com.apple.screencapture type -string "png"

# Keyboard
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Mouse and trackpad
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

killall Dock >/dev/null 2>&1 || true
killall Finder >/dev/null 2>&1 || true
killall SystemUIServer >/dev/null 2>&1 || true

echo "Done. Some changes may require logging out and back in."
