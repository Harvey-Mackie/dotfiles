#!/usr/bin/env bash

iterate() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: iterate <command> [args...]"
    echo "Runs <command> in each subdirectory of the current folder."
    return 1
  fi

  local base_dir="$PWD"
  local failed=0

  for entry in "$base_dir"/*/; do
    # strip trailing slash for display
    local name="${entry%/}"
    name="${name##*/}"

    if [[ ! -d "$entry" ]]; then
      continue
    fi

    echo "==> $name"
    (cd "$entry" && "$@")
    local exit_code=$?
    if [[ $exit_code -ne 0 ]]; then
      echo "    [exited $exit_code]"
      failed=$((failed + 1))
    fi
    echo ""
  done

  if [[ $failed -gt 0 ]]; then
    echo "$failed director$([ $failed -eq 1 ] && echo y || echo ies) had non-zero exit codes."
    return 1
  fi
}
