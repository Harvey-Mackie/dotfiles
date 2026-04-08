#!/usr/bin/env bash

# Keep an always-appending Bash history file at ~/.journal.
# This behaves like ~/.bash_history, but flushes after each prompt so tmux and
# concurrent shells do not wait until exit to persist commands.

if [[ $- != *i* ]]; then
  return
fi

export HISTFILE="$HOME/.journal"
touch "$HISTFILE"

shopt -s histappend

case ";${PROMPT_COMMAND:-};" in
  *";history -a;"*) ;;
  *)
    if [[ -n "${PROMPT_COMMAND:-}" ]]; then
      PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
    else
      PROMPT_COMMAND="history -a; history -n"
    fi
    ;;
esac
