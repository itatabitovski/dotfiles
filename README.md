# dotfiles

dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Quickstart

### Ubuntu/Debian

1. Install stow

```bash
sudo apt -y install stow
```

```bash
mkdir -p ~/projects
cd projects
git clone https://github.com/itatabitovski/dotfiles.git

alias stow="stow -t ~/ -d ~/projects/dotfiles"
```
