# dotfiles

Based on [this](https://www.atlassian.com/git/tutorials/dotfiles) blog post.

## Quickstart

Run this in your terminal:
```bash
curl https://gist.github.com/itatabitovski/0ff595d648012827d378c6ffe7be0fee | bash
```

The above command will execute the following things:
```bash
mkdir -p ~/src
git clone --bare https://github.com/itatabitovski/dotfiles.git $HOME/src/dotfiles

alias dotfiles="/usr/bin/git --git-dir=$HOME/src/dotfiles --work-tree=$HOME"

dotfiles checkout
if [ $? = 0 ]; then
    echo "Checked out config.";
else
    echo "Backing up pre-existing dot files.";
    mkdir -p ~/.dotfiles-backup
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;

dotfiles checkout
dotfiles config status.showUntrackedFiles no
```