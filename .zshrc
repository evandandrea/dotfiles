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

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct
zstyle :compinstall filename '/home/evan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:bzr:*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true
function _vsc_info() {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	RPROMPT="%{$fg[cyan]%}$vcs_info_msg_0_%{$reset_color%}"
}

[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
_vsc_info

# Proper colors.
alias tmux='TERM=screen-256color-bce tmux -2'

# I don't like all the fluff on the right hand side.
export RPROMPT=''

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

function jc {
jmx_host=$1
jmx_port=${2:-5000}
ssh_auth_server=$3
proxy_host=${3:-$jmx_host}
proxy_port=${4:-8123}

echo "connecting jconsole to $jmx_host:$jmx_port via SOCKS proxy $proxy_host using local port $proxy_port"
ssh -f -ND $proxy_port $proxy_host $ssh_auth_server
jconsole -J-DsocksProxyHost=localhost -J-DsocksProxyPort=${proxy_port} service:jmx:rmi:///jndi/rmi://${jmx_host}:${jmx_port}/jmxrmi
kill $(ps ax | grep "[s]sh -f -ND $proxy_port" | awk '{print $1}')
}

