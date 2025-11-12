# My Dotfiles

Personal configuration files for my development environment, managed with **GNU Stow** for easy setup and portability.

## 📦 Requirements

Install the required tools:

```bash
brew install nushell fish oh-my-posh zoxide fzf atuin eza carapace gh
```

For Linux:

```bash
sudo apt update && sudo apt install git stow
# or
pacman -S git stow
```

- `nushell` - Modern shell env
- `oh-my-posh` - Customisable prompt theme
- `zoxide` - A smarter cd command
- `fzf` - Fuzzy finder for files and commands
- `atuin` - shell history sync/search
- `eza` - A modern alternative to ls
- `carapace` - A multi-shell completion manager
- `gh` - GitHub’s official command line tool

Nerd Fonts:

```
brew install font-geist-mono-nerd-font
```

_On Linux you have to add `--cask` after `install`._

GeistMono, FiraCode, JotBransMono, MesloLG all seem cool.
Geist is the one from Vercel: https://vercel.com/font
Too bad Inter isn't here.

https://www.nerdfonts.com/font-downloads
https://github.com/ryanoasis/nerd-fonts

---

## ⚡ Node.js Environment (Volta)

[Volta](https://volta.sh) manages Node, npm, and pnpm consistently across shells.

```bash
# Install Volta
curl https://get.volta.sh | bash

# Install Node
volta install node

# Test
node -v
npm -v
```

**Alternatives:**

- [FNM](https://github.com/Schniz/fnm)
- [asdf](https://asdf-vm.com/)

## Volta packages:

```
volta install npm pnpm npm-check npm-check-updates vercel jq
```

- `npm` - The OG
- `pnpm` - Fast, disk space efficient package manager
- `npm-check` - Check for outdated, incorrect, and unused dependencies.
- `npm-check-updates` - Upgrades your package.json dependencies to the latest versions
- `vercel` - Vercel CLI
- `jq` - JSON processor and formatter

---

## 🐚 Shell Setup

### Nushell

- [Docs](https://www.nushell.sh/book/installation.html)

### Fish Shell

- [Fish](https://fishshell.com/) | [GitHub](https://github.com/fish-shell/fish-shell)
- Theme: [Oh My Posh](https://ohmyposh.dev/)
- Plugin manager: [Fisher](https://github.com/jorgebucaran/fisher)
- Plugins:
  - [Zoxide](https://github.com/ajeetdsouza/zoxide) – smarter `cd`
  - [Fzf](https://github.com/junegunn/fzf) – fuzzy finder
  - [Atuin](https://atuin.sh/) – shell history sync/search
  - Optional: [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish)

### Zsh

_I havent reinstalled Zsh with OhMyPosh on this machine so there should be legacy stuff in `.zshrc`_

- [Oh My Zsh](https://ohmyz.sh/)

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- [zsh-completions](https://github.com/zsh-users/zsh-completions):

```bash
git clone https://github.com/zsh-users/zsh-completions.git \
 ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

- Useful reads:

  - [Powerlevel10k setup](https://dev.to/abdfnx/oh-my-zsh-powerlevel10k-cool-terminal-1no0)
  - [Customization on Ubuntu](https://medium.com/@satriajanaka09/setup-zsh-oh-my-zsh-powerlevel10k-on-ubuntu-20-04-c4a4052508fd)

---

## 🔗 Managing with GNU Stow

Clone the repository and create symlinks:

```bash
git clone git@github.com:bronze/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .
```

---

## 🚀 Post-install Setup

To ensure all tools are initialized in every shell:

### Zsh (`~/.zshrc`)

```bash
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh)"
```

### Fish (`~/.config/fish/config.fish`)

```fish
atuin init fish | source
zoxide init fish | source
oh-my-posh init fish | source
```

### Nushell (`~/.config/nushell/config.nu`)

```nu
source-env (atuin init nu | save -f ~/.atuin.nu)
source-env (zoxide init nu | save -f ~/.zoxide.nu)
source-env (oh-my-posh init nu | save -f ~/.omp.nu)
```

---

## 📚 References

- [Dreams of Autonomy: This Zsh config is perhaps my favorite one yet.](https://youtu.be/ud7YxC33Z3w)
- [Dreams of Autonomy: Stow has forever changed the way I manage my dotfiles](https://youtu.be/y6XCebnB9gs)
- [dreamsofautonomy/dotfiles](https://github.com/dreamsofautonomy/dotfiles)

- [DevOps Toolbox: Is Nushell Worth The Hype?](https://youtu.be/uJsZATwQ3R8)
- [DevOps Toolbox: I Was Wrong About Nushell (I Finally Get It Now)](https://youtu.be/LFBOLx5KiME)
- [](https://youtu.be/)
- [](https://youtu.be/)

- [TechTimeFly: Oh My Posh customization](https://youtu.be/nGHgyPLi7UM)
- [Jordi Adoumie: Windows Terminal + Oh My Posh](https://youtu.be/lxNLJsDKyU4)
- [TroubleChute: WSL Ubuntu terminal customization](https://youtu.be/2LEnBXH8xV0)

## Also

A cross-platform dotfile management system using GNU Stow for simple, symlink-based configuration management.

- [Dotfiles Setup](https://github.com/ugudlado/shell)

_ Last updated 2025-11-12 _
