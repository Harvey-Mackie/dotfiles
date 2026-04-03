#!/usr/bin/env bash

# Append interactive shell commands to an execution-time journal.
# This is more reliable than ~/.bash_history across tmux panes and shells
# because it writes after each prompt rather than waiting for shell exit.

if [[ $- != *i* ]]; then
  return
fi

export COMMAND_JOURNAL_FILE="${COMMAND_JOURNAL_FILE:-$HOME/.local/state/command-journal.tsv}"

mkdir -p "$(dirname "$COMMAND_JOURNAL_FILE")"

__cmd_journal_active=0
__cmd_journal_last_histnum=""
__cmd_journal_last_cmd=""

__cmd_journal_precmd() {
  local exit_code=$?
  local hist_entry=""
  local histnum=""
  local cmd=""
  local tmux_session=""
  local tmux_pane="${TMUX_PANE:-}"

  [[ $__cmd_journal_active -eq 1 ]] && return

  hist_entry="$(history 1 2>/dev/null)" || return
  histnum="$(printf '%s\n' "$hist_entry" | sed -E 's/^[[:space:]]*([0-9]+).*/\1/')"
  cmd="$(printf '%s\n' "$hist_entry" | sed -E 's/^[[:space:]]*[0-9]+[[:space:]]+//')"

  [[ -z "$cmd" ]] && return
  [[ "$histnum" == "$hist_entry" ]] && return
  [[ "$histnum" == "$__cmd_journal_last_histnum" ]] && return
  [[ "$cmd" == "$__cmd_journal_last_cmd" ]] && return

  if command -v tmux >/dev/null 2>&1 && [[ -n "${TMUX:-}" && -n "$tmux_pane" ]]; then
    tmux_session="$(tmux display-message -p '#S' 2>/dev/null || true)"
  fi

  __cmd_journal_active=1
  printf '%s\t%s\t%s\t%s\t%s\t%s\n' \
    "$(date -Iseconds)" \
    "$PWD" \
    "$exit_code" \
    "${tmux_session:-}" \
    "${tmux_pane:-}" \
    "$cmd" >> "$COMMAND_JOURNAL_FILE"
  __cmd_journal_active=0

  __cmd_journal_last_histnum="$histnum"
  __cmd_journal_last_cmd="$cmd"
}

if [[ -n "${PROMPT_COMMAND:-}" ]]; then
  PROMPT_COMMAND="__cmd_journal_precmd; ${PROMPT_COMMAND}"
else
  PROMPT_COMMAND="__cmd_journal_precmd"
fi
