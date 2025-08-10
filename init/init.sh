#/bin/bash
init() {
  # Setup notes
  git clone https://github.com/Harvey-Mackie/personal-notes.git ~/notes

  # Setup temp folder
  mkdir ~/temp

  # Setup repos
  REPOS_DIR=~/repos
  REPOS_JSON=~/init/repos.json
  REPOS_ORG=$(jq -r '.org' "$REPOS_JSON")

  for key in $(jq -r 'keys[]' "$REPOS_JSON" | grep -v '^org$'); do
    dir="$REPOS_DIR"
    [[ "$key" != "root" ]] && dir="$REPOS_DIR/$key"
    _clone_repos "$(jq -c ".\"$key\"" "$REPOS_JSON")" "$REPOS_ORG" "$dir"
  done
}

_clone_repos() {
  local node="$1" org="$2" parent="$3"
  jq -c '.repos[]?' <<<"$node" | while read -r r; do
    if jq -e 'type=="string"' <<<"$r" >/dev/null; then
      repo=$(jq -r '.' <<<"$r")
      mkdir -p "$parent"
      echo "cloning $repo"
      git clone "https://github.com/${org}/${repo}.git" "$parent/$repo"
    else
      sub_name=$(jq -r '.name' <<<"$r")
      sub_org=$(jq -r '.org // empty' <<<"$r")
      _clone_repos "$r" "${sub_org:-$org}" "$parent/$sub_name"
    fi
  done
}

init
