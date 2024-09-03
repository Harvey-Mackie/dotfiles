eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#autoload -U colors && colors
export PS1="%F{214}%K{000}%m%F{015}%K{000}:%F{039}%K{000}%~%F{015}%K{000}\$ "

#adding git branches
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
setopt PROMPT_SUBST
PROMPT='%F{123}%K{000}%m%F{015}%K{000}:%F{039}%K{000}%~%F{141}%}$(parse_git_branch)%{%F{none}%} $ '

#export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
alias ls='ls -Gp'

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/harveymackie/.rd/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export JAVA_HOME=$(/usr/libexec/java_home)


alias k='kubectl'
alias kgp='k get pods'
# Alias to show the current context and available namespaces
alias k_ctx='kubectl config get-contexts && kubectl get namespaces'

# Function to change the namespace
k_ns() {
    kubectl config set-context --current --namespace="$1"
}
source <(kubectl completion zsh)

complete -o default -F __start_kubectl k


#shortcuts
alias sb='cd /Users/harveymackie/notes'
alias notes='cd /Users/harveymackie/notes'
alias repos='cd /Users/harveymackie/repos'
alias temp='cd /Users/harveymackie/temp'


# scripts
refresh(){
  source ~/.zshrc
}
