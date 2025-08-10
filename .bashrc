# Load homebrew if exists (use it on macOs and linux)
if [[ "$(uname -s)" == "Linux" ]] && [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  export PATH="/home/linuxbrew/.linuxbrew/opt/openjdk@17/bin:$PATH"
  export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/openjdk@17/include"
fi
if command -v brew >/dev/null 2>&1; then
  eval "$(brew shellenv)"
  export HOMEBREW_GIT_PATH="$(brew --prefix)/bin/git"
fi

# load starship (styling)
eval "$(starship init bash)"

# load tokens / env variables - example is simply a template, create a tokens file if you are forking the repo
if [[ -f ~/shell/tokens.sh ]]; then
  source ~/shell/tokens.sh
else
  source ~/shell/tokens.example.sh
fi

# aliases
## kubectl commands
alias k='kubectl'
alias kgp='k get pods'
alias k_ctx='kubectl config get-contexts && kubectl get namespaces'

## quick navigation to key repos
alias sb='cd ~/notes'
alias notes='cd ~/notes'
alias repos='cd ~/repos'
alias dotfiles='cd ~/dotfiles/'
alias temp='cd ~/temp'

## common spelling mistakes I make
alias claer='clear'

# loading shell script functions
if [[ -d ~/scripts ]]; then
  for f in ~/scripts/*.sh; do
    [ -f "$f" ] && source "$f"
  done
fi

# Allow vim motions in terminal
set -o vi
