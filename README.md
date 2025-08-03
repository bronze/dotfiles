# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

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

## Reference

https://youtu.be/y6XCebnB9gs

https://github.com/dreamsofautonomy/dotfiles
