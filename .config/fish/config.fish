if status is-interactive
    # Commands to run in interactive sessions can go here
end
zoxide init fish | source


# Created by `pipx` on 2024-05-08 05:08:50
set PATH $PATH /home/muna/.local/bin
set -gx EDITOR micro

set -x PATH $HOME/.pyenv/bin $PATH
status --is-interactive; and pyenv init --path | source
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

# dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
