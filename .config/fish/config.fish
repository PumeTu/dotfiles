set -U fish_greeting "" 
fish_add_path $HOME/.cargo/bin

alias config="/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME"
set -Ux MODULAR_HOME "/home/$USER/.modular"
fish_add_path /home/$USER/.modular/pkg/packages.modular.com_mojo/bin

starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/pumetu/miniconda3/bin/conda
    eval /home/pumetu/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/pumetu/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/pumetu/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/pumetu/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
