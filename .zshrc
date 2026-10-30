# ~/.zshrc

# Force login shell to ensure .zshrc is sourced
# (kept as-is — remove if you don't specifically need login-shell semantics,
# since it re-execs on every non-login shell launch)
[[ -o login ]] || exec zsh -l

# Editor and aliases
export EDITOR="nvim"
export VISUAL="nvim"
alias vv='nvim'
alias nm='no-mistakes'
alias cc='claude'
alias lsg="cd ~/workspace"


autoload -z edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line


# History settings
HISTFILE=~/.zsh_history
HISTSIZE=99999
SAVEHIST=99999
setopt appendhistory
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
setopt share_history

# Kubernetes aliases
alias k='kubectl'
alias kns='kubens'
alias ktx='kubectx'
alias kgps='kubectl get pods'
alias kgp='kubectl get pod'
alias kdes='kubectl describe'
alias kdel='kubectl delete'
alias kaf='kubectl apply -f'
alias klog='kubectl logs'

# Git aliases
alias gl='git log'
alias gc='git checkout'
alias gb='git branch'
alias gp='git pull'
alias gs='git status'
alias gps='git push'
alias gcb='git checkout $(git branch -a | fzf)'
alias gsl='git stash list'
alias gsa0='git stash apply stash@{0}'
alias gss='git stash save'

# eza (modern ls replacement)
if command -v eza &>/dev/null; then
  alias ls='eza'
  alias ll='eza -lhg'
  alias lla='eza -alhg'
  alias tree='eza --tree'
fi

# bat (modern cat replacement)
if command -v bat &>/dev/null; then
  alias cat='bat --paging=never --style=plain'
  alias catt='bat'
  alias cata='bat --show-all --paging=never'
fi


# Anchored to $HOME so it always finds the file regardless of cwd.
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

# for python 
export PATH="$HOME/.local/bin:$PATH"

# Completion + plugins
autoload -U compinit; compinit
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Claude script to run the api key 
# export ANTHROPIC_API_KEY=$(security find-generic-password -s "anthropic-api-key" -w)



# The for bind tmux crtl e and a 
bindkey -e
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# aws 

# --- AWS Production Environment Aliases ---
alias aws-prod-euw2="aws --profile prod --region eu-west-2"
alias aws-prod-euw1="aws --profile prod --region eu-west-1"
alias aws-prod-use1="aws --profile prod --region us-east-1"

# --- AWS Development Environment Aliases ---
alias aws-dev-euw2="aws --profile dev --region eu-west-2"
alias aws-dev-euw1="aws --profile dev --region eu-west-1"

## Azure devops
autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az


# Starship source at the end, don't modify
eval "$(starship init zsh)"

eval "$(~/.local/bin/mise activate zsh)"
