eval "$(kubectl completion zsh)"

fpath=(${ASDF_DATA_DIR}/installs/kubectx/$(asdf latest kubectx)/completions $fpath)

alias k="kubectl"
alias kc="kubectx"
alias kn="kubens"
