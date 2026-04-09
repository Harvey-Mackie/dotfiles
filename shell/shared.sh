NOTES_DIR="$HOME/Documents/notes"
REPOS_DIR="$HOME/Documents/repos"
TEMP_DIR="$HOME/Documents/temp"
DOTFILES_DIR="$HOME/dotfiles"

if [[ -f "$HOME/shell/tokens.sh" ]]; then
  source "$HOME/shell/tokens.sh"
elif [[ -f "$HOME/shell/tokens.example.sh" ]]; then
  source "$HOME/shell/tokens.example.sh"
fi

alias k='kubectl'
alias kgp='k get pods'
alias k_ctx='kubectl config get-contexts && kubectl get namespaces'

k_ns() {
  kubectl config set-context --current --namespace="$1"
}

alias sb='cd "$NOTES_DIR"'
alias notes='cd "$NOTES_DIR"'
alias repos='cd "$REPOS_DIR"'
alias dotfiles='cd "$DOTFILES_DIR"'
alias temp='cd "$TEMP_DIR"'
alias ..='cd ..'
alias claer='clear'

if [[ -d "$HOME/scripts" ]]; then
  for f in "$HOME"/scripts/*.sh; do
    [[ -f "$f" ]] && source "$f"
  done
fi
