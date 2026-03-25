# Claude Workspace
The workspace is a comprised list of .claude artifacts which I've experimented with or I'm in the process of experimenting. 

Intention is to build in public, document my learnings and build a solid foundation around what is actually useful in the space.

Rational for this approach is to counter "vibe" coding approach which is being pushed in the industry, in favour of an agentic data driven approach.

## Setup

`~/.claude` is managed as part of this dotfiles repo via [GNU stow](https://www.gnu.org/software/stow/). Rather than symlinking individual files, the entire `.claude/` directory is stowed so `~/.claude` becomes a symlink to `dotfiles/.claude`.

### Why this works

Claude Code writes runtime data (sessions, history, cache) into `~/.claude` at runtime. By moving the whole directory into the dotfiles repo and gitignoring the runtime dirs, you get:

- Skills, settings, and rules versioned and portable across machines
- Runtime data stays local and out of git
- `stow .` just works — no special-casing needed

### What's versioned vs ignored

| Path | Versioned |
|---|---|
| `skills/` | Yes |
| `settings.json` | Yes |
| `CLAUDE.md` / `rules/` | Yes |
| `settings.local.json` | No — machine-specific permissions |
| `sessions/`, `projects/`, `history.jsonl` | No — runtime data |
| `cache/`, `plugins/`, `backups/`, etc. | No — runtime data |

`projects/` contains Claude's per-project auto-memory. Kept locally but not committed — it's personal context that grows over time and doesn't belong in a public repo.

### Stow setup

Run from the repo root:
```bash
stow .
```

This creates `~/.claude -> dotfiles/.claude`. If `~/.claude` already exists as a real directory, move its contents in first:

```bash
cp -r ~/.claude/skills/* dotfiles/.claude/skills/
cp ~/.claude/settings.json dotfiles/.claude/
rm -rf ~/.claude
stow .
```
