# Init scripts

Optional bootstrap scripts for recreating the same `~/Documents` layout on a new machine.

## What `init.sh` creates

- `~/Documents/notes` for the notes repository
- `~/Documents/repos` for code repositories
- `~/Documents/temp` for scratch files

Repository cloning is driven by `repos.json`, so you can change the org and folder structure without editing the script logic.

## Requirements

- `git`
- `jq`

## Usage

```sh
cd ~/dotfiles/init
bash init.sh
```

The script is idempotent for clone targets that already exist: existing repositories are skipped instead of being recloned.

## Customising it

1. Update the notes repository URL in `init.sh` if your notes live elsewhere.
2. Edit `repos.json` to match the repos and folders you want under `~/Documents/repos`.
3. Keep paths aligned with the shell shortcuts in `shell/shared.sh`.
