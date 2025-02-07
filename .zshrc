# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Source
# export PYTHONPATH=/home/lisabug/dispflownet-release/python:$PYTHONPATH
# source /usr/local/bin/virtualenvwrapper.sh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    gcloud
    zsh-autosuggestions
    copypath
    aliases
    docker
    docker-compose
    copyfile
    sudo
    zsh-syntax-highlighting
    you-should-use
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="vim"
alias grep="grep --color=auto"
alias vpnstart="openvpn3 session-start -c robotruck"
alias vpnstop="openvpn3 session-manage -c robotruck -D"
alias sync_rt="onedrive --synchronize --single-directory \"Documents/RoboTruck\""

# swap ctrl and capslock
# setxkbmap -option ctrl:swapcaps

is_first=true
function gcp_project_id() {
  if [ -f "$HOME/.config/gcloud/active_config" ]; then
      gcp_profile=$(cat $HOME/.config/gcloud/active_config)
      project_id=$(awk '/project/{print $3}' $HOME/.config/gcloud/configurations/config_$gcp_profile)
      account_email=$(awk '/account/{print $3}' $HOME/.config/gcloud/configurations/config_$gcp_profile)

      if "${is_first}"; then
            is_first=false
              RPROMPT=${RPROMPT}%F{039}'${project_id}|${account_email}'%f
              fi
            fi
        }
        autoload -Uz add-zsh-hook
        add-zsh-hook precmd gcp_project_id

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
autoload -U compinit; compinit
