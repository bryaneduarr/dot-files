# env.nu
#
# Installed by:
# version = "0.102.0"
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

$env.PATH = (
  $env.PATH
  | prepend '/home/bryan/.nvm/versions/node/v23.11.0/bin/'
  | prepend '/home/linuxbrew/.linuxbrew/bin'
  | prepend '/home/linuxbrew/.linuxbrew/sbin'
)


$env.NVM_DIR = $"($env.HOME)/.nvm"

$env.EDITOR = "nvim"

$env.PROMPT_COMMAND_RIGHT = ""
