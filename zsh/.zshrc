#

ZSHRC_DIR="$HOME/.zshrc.d"

for f in "$ZSHRC_DIR"/*.zsh(N); do
  source "$f"
done
unset f

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit -u
