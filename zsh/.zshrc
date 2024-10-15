
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

if [[ $(uname) == "Darwin" ]]; then
  bindkey "^[[A" history-beginning-search-backward
  bindkey "^[[B" history-beginning-search-forward
else
  bindkey "^[OA" history-beginning-search-backward
  bindkey "^[OB" history-beginning-search-forward
fi

# Aliases
alias stow="stow -t ~/ -d ~/projects/dotfiles"

alias vim="nvim"
alias ls="ls -a --color"
alias ll="ls -l --color --group-directories-first"

if [[ $(uname) == "Linux" ]]; then
  alias pbcopy="xclip -selection clipboard"
  alias pbpaste="xclip -selection clipboard -o"
fi

# Functions
function asdf-update-all() {
  for tool in $(asdf plugin list); do
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

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
