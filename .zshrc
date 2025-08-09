# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/home/bronze/.local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/home/bronze/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting)

# zsh-completions (manual loading)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
alias coding="cd ~/coding/"
# alias 720="yt-dlp -f '720p' "
# alias 720="yt-dlp -S '+res:720,codec' "
alias 720="yt-dlp -f 'best[height=720]' "

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/home/bronze/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


eval "$(zoxide init --cmd cd zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/home/bronze/.bun/_bun" ] && source "/home/bronze/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# https://console-ninja.com/
PATH=~/.console-ninja/.bin:$PATH

# Turn off annoying BEEP on autocomplete
setopt NO_BEEP
# Go straight to folder names
setopt auto_cd

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# Priorizar o Fish do Homebrew no PATH
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
