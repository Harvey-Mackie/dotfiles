# Managed `.config` layout

This directory holds app and CLI configuration that is safe to sync between machines.

## Tracked

- `alacritty/`
- `git/ignore`
- `gh/config.yml`
- `nvim/`
- `starship.toml`

## Local-only

- `gh/hosts.yml` contains authentication state and should stay untracked.
- `cagent/` is machine-local tool state and is ignored.

When adding a new config here, update this README if the file affects bootstrap or has any machine-local caveats.
