set -U fish_greeting "" 
fish_add_path $HOME/.cargo/bin

alias config="/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME"

starship init fish | source
