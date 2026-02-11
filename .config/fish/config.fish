# Disable the default fish greeting
set fish_greeting

# Add Homebrew binaries to PATH (required for oh-my-posh and other tools)
# this comes BEFORE oh-my-posh
fish_add_path /home/linuxbrew/.linuxbrew/bin

# Detect VSCode on Windows
fish_add_path "/mnt/c/Users/bronze/AppData/Local/Programs/Microsoft VS Code/bin"

# ── volta: JavaScript toolchain manager ───────────────────────────────────────
# Docs: https://volta.sh/ | Repo: https://github.com/volta-cli/volta
set -gx VOLTA_HOME "$HOME/.volta"
fish_add_path "$VOLTA_HOME/bin"
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.console-ninja/.bin

# THEME
# ── oh-my-posh: prompt theming ────────────────────────────────────────────────
# Docs: https://ohmyposh.dev/ | Repo: https://github.com/jandedobbeleer/oh-my-posh
oh-my-posh init fish --config ~/.poshthemes/jandedobbeleer4.nord.json | source

# PLUGINS
# ── zoxide: smarter cd command ────────────────────────────────────────────────
# Docs: https://github.com/ajeetdsouza/zoxide
if test "$CLAUDECODE" != "1"
    zoxide init fish --cmd cd | source
    set -x _ZO_ECHO 1  # Echo target directory before jumping
end

# ── fzf: fuzzy finder key bindings ────────────────────────────────────────────
# Docs: https://github.com/junegunn/fzf
fzf --fish | source

# ── atuin: shell history sync and search ──────────────────────────────────────
# Docs: https://github.com/ellie/atuin
# https://github.com/atuinsh/atuin/issues/2803
# https://github.com/atuinsh/atuin/pull/2902
# https://github.com/atuinsh/atuin/issues/2940

atuin init fish | sed "s/-k up/up/g" | source

# ── carapace: A multi-shell completion manager ────────────────────────────────
# Docs: https://carapace-sh.github.io/carapace-bin/setup.html
# set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
# carapace _carapace | source
# ${UserConfigDir}/fish/config.fish
set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
# carapace _carapace | source


function joinmd
    find . -name "*.md" -exec cat {} + > all_meetings.md
end

# Shortcuts
alias coding="cd ~/coding/"
alias dotfiles="cd '/home/bronze/dotfiles'"
alias obsidian="cd '/mnt/c/Users/bronze/Dropbox/Obsidian/Bronze Obsidian'"
# abbr --add obs "cd '/mnt/c/Users/bronze/Dropbox/Obsidian/Bronze Obsidian'"
