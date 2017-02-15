#
# Required for sqlplus to edit the last command with ed
#
export EDITOR="gvim -f"

#
# Enable core files
#
ulimit -c unlimited

#
# source git-completion.bash to autocomplete git commands
#
#source $HOME/git-completion.bash

#
# nljhfl's personal preferences
#
#umask 0002
export PS1="\`ex=\$?; if [ \$(date +%k) -lt 17 ]; then echo [\[\e[1m\]\@\[\e[0m\]]; else echo [\[\e[1m\]\[\e[31m\]go home\[\e[0m\]\[\e[0m\]]; fi; exit \$ex\`:\[\e[36;1m\]\[\033[1m\]\h\[\033[0m\]:\`if [ \$? = 0 ]; then echo \[\e[35m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`:\W:\\$ "
export PS2='\[\e[36;1m\]\[\033[1m\]And then?>\[\033[0m\]'
#export PS1='\h\[\033[1m\]:\W:\$ '
alias ll='ls -l -h --file-type --color=auto'
alias vncserver='vncserver -geometry 1600x900 -depth 16 -dpi 96'
alias jprun='/apps/sssdev/share/jprun'
alias ls='ls -lhF --color=auto --time-style=long-iso'
alias l='ls'
alias grepn='grep -n'
alias grepi='grep -i'
alias grpe='grep'
alias mplayer='mplayer -brightness 0 -contrast 0 -hue 0 -saturation 0 -edlout edlout -nosound -zoom -vf screenshot -vo x11 -noborder'
alias splayer='/usr/bin/mplayer -brightness 0 -contrast 0 -edlout edlout'
alias gn='gnuplot'
alias mount='mount | column -t'
alias jobs='jobs -l'
alias gitk='gitk --all' 
alias tailf='multitail -f'
alias gitstuk='git update-index --refresh'
alias gittfpull='git tf pull --deep'
alias envgrep='env | grep'
alias vim='vim -b'
alias gvim='gvim -b'

#give filetypes a color. check /etc/DIR_COLOR for more info
eval $(dircolors -b /etc/DIR_COLORS)


#if [ $TERM = 'xterm' ] || [ $TERM = 'xterm-color' ]; then
#    export PROMPT_COMMAND='echo -ne "\033]2;Terminal:`pwd`\007"'
#fi

# pimp my grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;31'

# Fix pagers in git
export LESS="$LESS -FRXK"

# use termcap colors in 'less'
# export LESS_TERMCAP_mb=$'\E[01;31m'
# export LESS_TERMCAP_md=$'\E[01;31m'
# export LESS_TERMCAP_me=$'\E[0m'
# export LESS_TERMCAP_se=$'\E[0m'
# export LESS_TERMCAP_so=$'\E[01;44;33m'
# export LESS_TERMCAP_ue=$'\E[0m'
# export LESS_TERMCAP_us=$'\E[01;32m'

# somewhat speed up firefox
# export MOZ_DISABLE_PANGO=1
