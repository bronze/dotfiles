# Setup

## Terminal

**Instal oh-my-zsh with curl**

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

**Install fast syntax highlighting**

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

**Install zsh autosuggestions**

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

**Install the theme**

```sh
git clone https://github.com/onlurking/lambda-custom-zsh-theme.git ~/.oh-my-zsh/custom/themes/lambda-custom-zsh-theme

ln -s "$ZSH_CUSTOM/themes/lambda-custom-zsh-theme/lambda-mod.zsh-theme" "$ZSH_CUSTOM/themes/lambda-mod.zsh-theme"
```

**Instal FZF**

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

~/.fzf/install
```

**Edit the ~/.zshrc**

```sh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="lambda-mod"

plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```
