# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="blinks"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/evan/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

# Added by me.
setopt extendedglob

export DEBEMAIL="ev@ubuntu.com"
export DEBFULLNAME="Evan Dandrea"
export DH_ALWAYS_EXCLUDE='CVS:.svn:{arch}:.arch-ids:.bzr:.git'

# Workaround
bindkey "5C" forward-word
bindkey "5D" backward-word

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
