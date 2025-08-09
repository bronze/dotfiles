# ── oh-my-posh: prompt theming ────────────────────────────────────────────────
# Docs: https://ohmyposh.dev/ | Repo: https://github.com/jandedobbeleer/oh-my-posh
oh-my-posh init fish --config ~/.poshthemes/tonybaloney.nord.omp.json | source

# Add Homebrew binaries to PATH (required for oh-my-posh and other tools)
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH

# Disable the default fish greeting
set fish_greeting


# ── zoxide: smarter cd command ────────────────────────────────────────────────
# Docs: https://github.com/ajeetdsouza/zoxide
zoxide init fish --cmd cd | source
set -x _ZO_ECHO 1  # Echo target directory before jumping


# ── fzf: fuzzy finder key bindings ────────────────────────────────────────────
# Docs: https://github.com/junegunn/fzf
fzf --fish | source


# ── atuin: shell history sync and search ─────────────────────────────────────
# Docs: https://github.com/ellie/atuin
atuin init fish | source
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
