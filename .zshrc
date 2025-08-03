# ----------------------------------------
# Powerlevel10k Instant Prompt
# ----------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ----------------------------------------
# PATH Configuration
# ----------------------------------------
export PATH="/usr/local/bin:$PATH"
export PATH="/home/bronze/.local/bin:$PATH"

# pnpm
export PNPM_HOME="/home/bronze/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# console-ninja
PATH=~/.console-ninja/.bin:$PATH

# ----------------------------------------
# Oh My Zsh Setup
# ----------------------------------------
export ZSH="/home/bronze/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ----------------------------------------
# NVM (Node Version Manager)
# ----------------------------------------
source ~/.nvm/nvm.sh

# ----------------------------------------
# Prompt Configuration
# ----------------------------------------
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ----------------------------------------
# Aliases
# ----------------------------------------
alias coding="cd ~/coding/"
# alias 720="yt-dlp -f '720p' "
# alias 720="yt-dlp -S '+res:720,codec' "
alias 720="yt-dlp -f 'best[height=720]' "

# ----------------------------------------
# CLI Enhancements
# ----------------------------------------

# zoxide (smart cd)
eval "$(zoxide init --cmd cd zsh)"

# fzf (fuzzy finder)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/home/bronze/.bun/_bun" ] && source "/home/bronze/.bun/_bun"

# ----------------------------------------
# Zsh Options
# ----------------------------------------

# Disable bell sound on autocomplete
setopt NO_BEEP

# Enable auto-cd (just type folder name to cd into it)
setopt auto_cd
