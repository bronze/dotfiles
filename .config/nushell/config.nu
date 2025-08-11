# config.nu
#
# Installed by:
# version = "0.106.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings,
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.buffer_editor = "code"

# Disable the default greeting
$env.config.show_banner = false

# Add Homebrew binaries to PATH (required for oh-my-posh and other tools)
# Beind done in env.nu in Nushell
# let-env PATH = ($env.PATH | append '/home/linuxbrew/.linuxbrew/bin')

# THEME
# ── oh-my-posh: prompt theming ────────────────────────────────────────────────
# Docs: https://ohmyposh.dev/ | Repo: https://github.com/jandedobbeleer/oh-my-posh
# oh-my-posh init nu --config ~/.poshthemes/tonybaloney.nord.omp.json

# PLUGINS
# ── zoxide: smarter cd command ────────────────────────────────────────────────
# Docs: https://github.com/ajeetdsouza/zoxide
source ~/.config/nushell/zoxide.nu

# ── atuin: shell history sync and search ──────────────────────────────────────
# Docs: https://github.com/ellie/atuin
$env.ATUIN_NOBIND = "true"
source ~/.config/nushell/atuin.nu

# ── carapace: A multi-shell completion manager ────────────────────────────────
# Docs: https://carapace-sh.github.io/carapace-bin/setup.html
source ~/.cache/carapace/init.nu


# Custom completions
source ~/.config/nushell/completions/git-completions.nu
source ~/.config/nushell/completions/npm-completions.nu