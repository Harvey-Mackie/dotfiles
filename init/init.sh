#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOCUMENTS_DIR="$HOME/Documents"
NOTES_DIR="$DOCUMENTS_DIR/notes"
TEMP_DIR="$DOCUMENTS_DIR/temp"
REPOS_DIR="$DOCUMENTS_DIR/repos"
REPOS_JSON="$SCRIPT_DIR/repos.json"

clone_repo() {
  local url="$1"
  local destination="$2"

  if [[ -d "$destination/.git" ]]; then
    echo "Skipping $destination (already cloned)"
    return
  fi

  mkdir -p "$(dirname "$destination")"
  echo "Cloning $url -> $destination"
  git clone "$url" "$destination"
}

init() {
  mkdir -p "$DOCUMENTS_DIR" "$TEMP_DIR" "$REPOS_DIR"

  if ! command -v jq >/dev/null 2>&1; then
    echo "jq is required to run init.sh" >&2
    exit 1
  fi

  clone_repo "https://github.com/Harvey-Mackie/personal-notes.git" "$NOTES_DIR"

  local repos_org
  repos_org="$(jq -r '.org' "$REPOS_JSON")"

  while IFS= read -r key; do
    local dir="$REPOS_DIR"
    [[ "$key" != "root" ]] && dir="$REPOS_DIR/$key"
    _clone_repos "$(jq -c ".\"$key\"" "$REPOS_JSON")" "$repos_org" "$dir"
  done < <(jq -r 'keys[]' "$REPOS_JSON" | grep -v '^org$')
}

_clone_repos() {
  local node="$1"
  local org="$2"
  local parent="$3"

  jq -c '.repos[]?' <<<"$node" | while read -r r; do
    if jq -e 'type=="string"' <<<"$r" >/dev/null; then
      local repo
      repo="$(jq -r '.' <<<"$r")"
      mkdir -p "$parent"
      clone_repo "https://github.com/${org}/${repo}.git" "$parent/$repo"
    else
      local sub_name
      local sub_org
      sub_name="$(jq -r '.name' <<<"$r")"
      sub_org="$(jq -r '.org // empty' <<<"$r")"
      _clone_repos "$r" "${sub_org:-$org}" "$parent/$sub_name"
    fi
  done
}

init
