export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
export XDG_DATA_DIRS="$XDG_DATA_HOME/flatpak/exports/share:$XDG_DATA_DIRS"

export EDITOR="vim"

# HISTORY
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt APPENDHISTORY
# END HISTORY

setopt interactivecomments

# zsh plugins
# Installation: apt install zsh-syntax-highlighting zsh-autosuggestions
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

export PATH=~/.local/bin:$PATH

# Aliases
alias stow="stow -t ~/ -d ~/projects/dotfiles"

alias vim="nvim"
alias ls="ls --color"
alias ll="ls -l --color --group-directories-first"

# Installation: apt install xclip
if [[ $(uname) == "Linux" ]]; then
  alias pbcopy="xclip -selection clipboard"
  alias pbpaste="xclip -selection clipboard -o"
fi

function trivy {
  docker run --pull always -v /var/run/docker.sock:/var/run/docker.sock -v $HOME/.cache/trivy:/root/.cache/ aquasec/trivy:latest "$@"
}
