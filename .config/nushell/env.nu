# env.nu
#
# Installed by:
# version = "0.106.1"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

# Homebrew on nushell https://reimbar.org/dev/nushell/ https://www.nushell.sh/book/configuration.html#homebrew
use std "path add"
path add "/home/linuxbrew/.linuxbrew/bin"

# Node via NVM e PNPM -> Volta taking care of this
# path add "/home/bronze/.nvm/versions/node/v20.14.0/bin"
# path add "/home/bronze/.local/share/pnpm"

# ── volta: JavaScript toolchain manager ───────────────────────────────────────
# Docs: https://volta.sh/ | Repo: https://github.com/volta-cli/volta
path add ($env.PATH | prepend $"($nu.home-path)/.volta/bin")

# PLUGINS
# ── zoxide: smarter cd command ────────────────────────────────────────────────
# Docs: https://github.com/ajeetdsouza/zoxide
zoxide init nushell --cmd cd | save -f ~/.zoxide.nu
