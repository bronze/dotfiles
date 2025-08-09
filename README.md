# My Dotfiles

Personal configuration files for my development environment, managed with **GNU Stow** for easy setup and portability.

## 📦 Requirements

Install the required tools:

```bash
brew install nushell fish oh-my-posh zoxide fzf atuin
brew install --cask font-fira-code-nerd-font font-meslo-lg-nerd-font
```

For Linux:

```bash
sudo apt update && sudo apt install git stow
# or
pacman -S git stow
```

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
volta install npm pnpm npm-check vercel
```

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

- [Zsh config walkthrough](https://youtu.be/ud7YxC33Z3w)
- [GNU Stow for dotfiles](https://youtu.be/y6XCebnB9gs)
- [dreamsofautonomy/dotfiles](https://github.com/dreamsofautonomy/dotfiles)
- [Oh My Posh customization](https://youtu.be/nGHgyPLi7UM)
- [Windows Terminal + Oh My Posh](https://youtu.be/lxNLJsDKyU4)
- [WSL Ubuntu terminal customization](https://youtu.be/2LEnBXH8xV0)
