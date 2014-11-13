# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Added by me.
setopt extendedglob

export TERM=xterm-color
export EDITOR=vim

export DEBEMAIL="ev@ubuntu.com"
export DEBFULLNAME="Evan Dandrea"
export DH_ALWAYS_EXCLUDE='CVS:.svn:{arch}:.arch-ids:.bzr:.git'

# Run a command every time the file is modified
modified () {
    wait_file="$1"
    shift
    wait_command="$1"
    shift
    wait_args="$@"
    while :; do
        inotifywait "$wait_file" -e close_write
        $wait_command $wait_args
    done
}

