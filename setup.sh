#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APPLY_MACOS_DEFAULTS=false

for arg in "$@"; do
  case "$arg" in
    --apply-macos-defaults)
      APPLY_MACOS_DEFAULTS=true
      ;;
    *)
      echo "Unknown option: $arg" >&2
      echo "Usage: ./setup.sh [--apply-macos-defaults]" >&2
      exit 1
      ;;
  esac
done

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required before running setup.sh" >&2
  exit 1
fi

if ! command -v stow >/dev/null 2>&1; then
  brew install stow
fi

cd "$REPO_ROOT"
stow .
brew bundle --file "$REPO_ROOT/.Brewfile"

if [[ "$APPLY_MACOS_DEFAULTS" == true ]]; then
  if [[ "$(uname -s)" != "Darwin" ]]; then
    echo "macOS defaults can only be applied on Darwin" >&2
    exit 1
  fi

  bash "$REPO_ROOT/macos/defaults.sh"
else
  echo "Skipping macOS defaults. Run ./setup.sh --apply-macos-defaults to apply them."
fi
