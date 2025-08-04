# oh-my-posh init fish | source https://ohmyposh.dev/ https://github.com/jandedobbeleer/oh-my-posh
oh-my-posh init fish --config ~/.poshthemes/tonybaloney.nord.omp.json | source
set -gx PATH /home/linuxbrew/.linuxbrew/bin $PATH
set fish_greeting

# Set up zoxide https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# Set up fzf key bindings https://github.com/junegunn/fzf
fzf --fish | source
