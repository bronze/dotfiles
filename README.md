# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### OhMyZsh

https://gist.github.com/onlurking/a9537a57600486e6f7408e73f985f4ec

https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0

https://medium.com/@satriajanaka09/setup-zsh-oh-my-zsh-powerlevel10k-on-ubuntu-20-04-c4a4052508fd

### zsh-completions

https://github.com/zsh-users/zsh-completions

```
git clone https://github.com/zsh-users/zsh-completions.git \
 ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

### Git

```
pacman -S git
```

```
sudo apt update
sudo apt install git
```

### Stow

```
pacman -S stow
```

```
sudo apt update
sudo apt install stow
```

```
stow --version
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/bronze/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

## References

This Zsh config is perhaps my favorite one yet.: https://youtu.be/ud7YxC33Z3w

Stow has forever changed the way I manage my dotfiles: https://youtu.be/y6XCebnB9gs

https://github.com/dreamsofautonomy/dotfiles

Level up the look of your terminal with Oh-My-Posh: https://youtu.be/nGHgyPLi7UM

How to Customize WSL & CMD in Windows Terminal with Oh My Posh!: https://youtu.be/lxNLJsDKyU4

Make WSL/Ubuntu Terminal Look Better | Oh My Posh Guide: https://youtu.be/2LEnBXH8xV0
