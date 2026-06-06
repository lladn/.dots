# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Force login shell to ensure .zshrc is sourced
[[ -o login ]] || exec zsh -l
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Editor and aliases
export EDITOR='nvim'
alias v='nvim'
alias lsg="cd ~/workspace"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}S[S[S[S[S[waiting...%f"
#
#
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

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
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

SPACESHIP_PROMPT_ORDER=(
  time          # Time stampts section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  ruby          # Ruby section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  docker        # Docker section
  venv          # virtualenv section
  line_sep      # Line break
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL_SUCCESS='❯ '
SPACESHIP_CHAR_SYMBOL_FAILURE='❯ '

# To mute the beep 
unsetopt beep
# This is for the shutdown 
export  WSL_DISTRO_NAME="Ubuntu"
alias shutdown='wsl.exe --terminate $WSL_DISTRO_NAME'
alias reboot='cd /mnt/c/ && cmd.exe /c start "Rebooting WSL" cmd /c "timeout 5 && title "$WSL_DISTRO_NAME" && wsl -d $WSL_DISTRO_NAME" && wsl.exe --terminate $WSL_DISTRO_NAME'



# Homebrew 
export BREW_HOME="/home/linuxbrew/.linuxbrew/bin"
export PATH="$PATH:$BREW_HOME"

autoload -U compinit; compinit
