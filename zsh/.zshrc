
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

export EDITOR="vim"

# HISTORY
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt APPENDHISTORY
# END HISTORY

setopt interactivecomments

# zsh plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

if [[ $(uname) == "Darwin" ]]; then
  bindkey "^[[A" history-beginning-search-backward
  bindkey "^[[B" history-beginning-search-forward
else
  bindkey "^[OA" history-beginning-search-backward
  bindkey "^[OB" history-beginning-search-forward
fi

export PATH=~/bin:$PATH
export PATH=~/go/bin:$PATH

# Aliases
alias stow="stow -t ~/ -d ~/projects/dotfiles"

alias vim="nvim"
alias ls="ls --color"
alias ll="ls -l --color --group-directories-first"

alias k="kubectl"

if [[ $(uname) == "Linux" ]]; then
  alias pbcopy="xclip -selection clipboard"
  alias pbpaste="xclip -selection clipboard -o"
fi

# Functions
function asdf-update-all() {
  echo "Update asdf plugins..."
  asdf plugin-update --all
  for tool in $(asdf plugin list); do
    echo "Processing ${tool}..."
    asdf install "${tool}" latest  \
      &&  asdf global "${tool}" latest  \
      &&  echo "${tool} set globally"
  done
}

# Tools
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(kubectl completion zsh)"

# kubesess
source ~/.kube/kubesess/scripts/sh/kubesess.sh
source ~/.kube/kubesess/scripts/sh/completion.sh


# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/ilin/.lmstudio/bin"


function dc-svc {
  svc=$(ls --color=never -d ~/docker-services/* | awk '{print $NF}' | cut -d '/' -f 5 | fzf)
  echo "${svc}"
}

function dc-start {
  if [ -z "${1}" ]; then
    local svc=$(dc-svc)
  fi
  cd ~/docker-services/"${svc}"
  echo "Starting docker-compose service ${svc}..."
  docker compose up --remove-orphans --force-recreate -d
}

function dc-stop {
  if [ -z "${1}" ]; then
    local svc=$(dc-svc)
  fi
  cd ~/docker-services/"${svc}"
  echo "Stopping docker-compose service ${svc}..."
  docker compose stop; docker compose rm -f
}

function dc-restart {
  if [ -z "${1}" ]; then
    local svc=$(dc-svc)
  fi
  dc-stop "${svc}"
  dc-start "${svc}"
}

function trivy {
  docker run --pull always -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.cache/trivy:/root/.cache/  aquasec/trivy:latest "$@"
}
