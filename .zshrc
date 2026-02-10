# OPENSPEC:START
# OpenSpec shell completions configuration
fpath=("/home/bronze/.oh-my-zsh/custom/completions" $fpath)
autoload -Uz compinit
compinit
# OPENSPEC:END

##### PATHS
# ── Homebrew: package manager ─────────────────────────────────────────────────
# Docs: https://brew.sh/
if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# ── VS Code: editor on Windows WSL ────────────────────────────────────────────
# Docs: https://code.visualstudio.com/
if [ -d "/mnt/c/Users/bronze/AppData/Local/Programs/Microsoft VS Code/bin" ]; then
  export PATH="/mnt/c/Users/bronze/AppData/Local/Programs/Microsoft VS Code/bin:$PATH"
fi

# ── Local binaries ────────────────────────────────────────────────────────────
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.console-ninja/.bin:$PATH"

##### TOOLCHAINS
# ── Volta: JavaScript toolchain manager ───────────────────────────────────────
# Docs: https://volta.sh/ | Repo: https://github.com/volta-cli/volta
export VOLTA_HOME="$HOME/.volta"
[ -d "$VOLTA_HOME/bin" ] && export PATH="$VOLTA_HOME/bin:$PATH"

# ── pnpm: fast package manager ────────────────────────────────────────────────
# Docs: https://pnpm.io/
export PNPM_HOME="$HOME/.local/share/pnpm"
[ -d "$PNPM_HOME" ] && export PATH="$PNPM_HOME:$PATH"

# ── Bun: JavaScript runtime ───────────────────────────────────────────────────
# Docs: https://bun.sh/
export BUN_INSTALL="$HOME/.bun"
[ -d "$BUN_INSTALL/bin" ] && export PATH="$BUN_INSTALL/bin:$PATH"

# ── Console Ninja ────────────────────────────────────────────────────────────
# Docs: https://console-ninja.com/
[ -d "$HOME/.console-ninja/.bin" ] && export PATH="$HOME/.console-ninja/.bin:$PATH"

##### ZSH OPTIONS
# ── Shell behavior ───────────────────────────────────────────────────────────
setopt NO_BEEP
setopt AUTO_CD

##### OH-MY-ZSH
# ── Framework & Theme ─────────────────────────────────────────────────────────
# Docs: https://ohmyz.sh/
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# ── Plugins ───────────────────────────────────────────────────────────────────
plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting)

# ── zsh-completions: additional completions ───────────────────────────────────
# Docs: https://github.com/zsh-users/zsh-completions
fpath+=(${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src)
autoload -U compinit && compinit

source "$ZSH/oh-my-zsh.sh"

##### PLUGINS
# ── zoxide: smarter cd command ────────────────────────────────────────────────
# Docs: https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init --cmd cd zsh)"

# ── fzf: fuzzy finder ─────────────────────────────────────────────────────────
# Docs: https://github.com/junegunn/fzf
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"

# ── atuin: shell history sync and search ──────────────────────────────────────
# Docs: https://github.com/ellie/atuin
eval "$(atuin init zsh)"

# ── carapace: multi-shell completions ─────────────────────────────────────────
# Docs: https://carapace-sh.github.io/carapace-bin/
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
source <(carapace _carapace)

##### ALIASES
# ── Custom commands ──────────────────────────────────────────────────────────
alias coding="cd ~/coding/"
alias dotfiles="cd '/home/bronze/dotfiles'"
alias obsidian="cd '/mnt/c/Users/bronze/Dropbox/Obsidian/Bronze Obsidian'"
alias 720="yt-dlp -f 'best[height=720]' "

##### THEME
# ── Powerlevel10k: prompt theming ─────────────────────────────────────────────
# Docs: https://github.com/romkatv/powerlevel10k
[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"
