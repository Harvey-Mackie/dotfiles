# macOS defaults

`defaults.sh` applies the macOS preferences that are worth recreating on a new machine.

## Usage

```sh
cd ~/dotfiles
bash macos/defaults.sh
```

Or run:

```sh
./setup.sh --apply-macos-defaults
```

## Current settings

- Dock auto-hide enabled
- Recent apps hidden from the Dock
- MRU Spaces disabled
- Finder shows file extensions, path bar, and status bar
- Finder defaults to list view
- Screenshots saved as PNG
- Key repeat set faster than the macOS default
- Natural scrolling disabled

## Manual steps that still matter

- Set the keyboard input source to `British - PC` if you want `Shift + 2` to type `"`
- Review any trackpad- or mouse-specific settings that you prefer to keep separate from the shared defaults script
