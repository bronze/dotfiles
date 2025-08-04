# oh-my-posh init fish | source https://ohmyposh.dev/ https://github.com/jandedobbeleer/oh-my-posh
oh-my-posh init fish --config ~/.poshthemes/tonybaloney.nord.omp.json | source
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
set fish_greeting

# Set up zoxide https://github.com/ajeetdsouza/zoxide
# zoxide init fish | source
zoxide init fish --cmd cd | source # zoxide replacing the cd command
set -x _ZO_ECHO '1' # When set to 1, z will print the matched directory before navigating to it.


# Set up fzf key bindings https://github.com/junegunn/fzf
fzf --fish | source

# Set up Atuin for command history
atuin init fish | source
