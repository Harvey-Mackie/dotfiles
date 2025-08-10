#!/bin/bash

peek() {
  local dir="${1:-.}"
  fd --type f --hidden --exclude .git . "$dir" | \
    fzf --preview 'bat --style=numbers --color=always --pager=never -- {} || cat -- {}' \
        --preview-window=right:70% \
        --height=100% \
        --bind "enter:execute(${EDITOR:-vim} {})" \
        --reverse \
        --ansi
}
