# Load Homebrew if it exists (use it on macOS and Linux).
if [[ "$(uname -s)" == "Linux" ]] && [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  export PATH="/home/linuxbrew/.linuxbrew/opt/openjdk@17/bin:$PATH"
  export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/openjdk@17/include"
elif [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if command -v brew >/dev/null 2>&1; then
  eval "$(brew shellenv)"
  export HOMEBREW_GIT_PATH="$(brew --prefix)/bin/git"
fi

# Load starship prompt.
eval "$(starship init bash)"

if [[ -f "$HOME/shell/shared.sh" ]]; then
  source "$HOME/shell/shared.sh"
fi

if command -v kubectl >/dev/null 2>&1; then
  source <(kubectl completion bash)
  complete -o default -F __start_kubectl k
fi

# Allow vim motions in terminal
set -o vi

case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) export PATH="$HOME/.local/bin:$PATH" ;;
esac
