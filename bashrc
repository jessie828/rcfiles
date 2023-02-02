# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

#
# Path settings
#
export PATH=~/bin:/apps/sss/share:/apps/sssdev/share:/sbin:/usr/sbin:$PATH #:/usr/share/lmod/lmod/libexec

#set proxy settings

#
# Required for sqlplus to edit the last command with ed
#
#export EDITOR="gvim -f"
 if  xhost >& /dev/null ; then export EDITOR="gvim -f"; else export EDITOR="vim"; fi

#
# for ccache to go to a new folder
#
export CCACHE_DIR=/scratch/ccache-hernandezjj


# for tmux histcontrol
export HISTCONTOROL=ignoreboth

#
# Enable core files
#
ulimit -c unlimited

#
# Git complition sourcing
#
source /scratch/hernandezjj/home/git-completion.bash 2>/dev/null
#
# add diff so fancy
#
export PATH=$PATH:/scratch/git/diff-so-fancy

#
# add fzf to my path
#
if [ -z "${VNC}" ]
then
    [ -f ~/.fzf.bash ] && source ~/.fzf.bash 2>/dev/null
fi

#
# colors used in PS1
#
BOLD="\[\e[1m\]"
RED="\[\e[31m\]"
YELLOW="\[\e[33m\]"
CYAN="\[\e[36m\]"
MAGENTA="\[\e[35m\]"
RESET="\[\e[0m\]"

#
# create private functions
#

#
# git branch status and name in PS1
#
parse_git_dirty() {
  [[ $(git rev-parse --git-dir 2>/dev/null) && $(git status -uno 2> /dev/null | tail -n1) != "nothing to commit (use -u to show untracked files)" ]] && echo '!'
}

parse_git_branch() {
      branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
      if [ $? -eq 0 ]
      then
         echo ${branch} | sed -e "s/* \(.*\)/\1/"
      else
         echo ':-|'
      fi
}

setCursorColor() { 
    echo -ne "\e]12;$1\a"; 
}

#
# hernandezjj's personal preferences
#
#met kleur
#export PS1='\[\e[36;1m\]\[\033[1m\]\h\[\033[0m\]:\W:\$:'
export PS1="\`ex=\$?; if [ \$(date +%k) -lt 17 ]; then echo [${BOLD}\@${RESET}]; else echo [${RED}${BOLD}go home${RESET}]; fi; exit \$ex\`:${CYAN}${BOLD}\h${RESET}:\$(if [ \$? = 0 ]; then echo ${MAGENTA}^_^${RESET}; else echo ${RED}O_O${RESET}; fi):\W:(${YELLOW}\$(parse_git_branch)${RESET}${RED}\$(parse_git_dirty)${RESET})\$ "
export PS2="${CYAN}${BOLD}And then?>${RESET}"
#Ninja status message
export NINJA_STATUS="[%p %s/%t %u] "
#stop closing of shell
export IGNOREEOF=10
#oud
#export PS1='\h:\W:\$ '
alias ls='ls -lhF --color=auto --time-style=long-iso'
alias rm='rm -I'
alias l='ls'
alias vncserver='vncserver -geometry 1600x920 -depth 16 -dpi 96'
alias vnclaptop='vncserver -geometry 1366x768 -depth 16 -dpi 96'
alias grepn='grep -n'
alias mplayer='mplayer -brightness 0 -contrast 0 -hue 0 -saturation 0 -edlout edlout -nosound -zoom -vf screenshot -vo x11 -noborder'
alias splayer='/usr/bin/mplayer -brightness 0 -contrast 0 -edlout edlout'
alias gn='gnuplot'
alias mount='mount | column -t'
alias jobs='jobs -l'
alias tailf='multitail -f'
alias git-root='cd $(git rev-parse --show-toplevel)'
alias envgrep='env | grep'
alias jpenvgrep='jprun env | grep'
alias vim='vim -b'
alias gvim='gvim -b'
alias tarc="tar -cvzf"
alias pdf='evince'
alias dropbox='/scratch/git/Dropbox-Uploader/dropbox_uploader.sh'
alias calendar='PATH=/usr/bin/:PATH calendar'
alias loadmodule='. /apps/sss/Lmod/etc/profile.d/z01_lmod-hpcs.sh'
alias vi='vimx'
alias vim='vimx'
alias grpe='grep'
alias gti='git'
alias gotorelease='cd /apps/sssdev/jobpro/dev'
alias setrhel8mods='source ~/bin/setmodulepath.sh 8' 
alias setrhel7mods='source ~/bin/setmodulepath.sh 7' 
#alias jobpro="jobpro -reverse"



# add forward search when reverse searching in bash. (ctrl + s when ctrl + r-ing)
[[ $- == *i* ]] && stty -ixon

function git-goto() { worktreepath=$(git worktree list | grep "$1" | cut -f1 -d' '); cd $worktreepath;} 

#set ENV variable to locate kshrc when starting ksh
export ENV='~/.kshrc'

#
# Gnuplot font work around
#
export GDFONTPATH=/usr/share/fonts/liberation
export GNUPLOT_DEFAULT_GDFONT=LiberationSans-Regular


#give filetypes a color. check /etc/DIR_COLOR for more info
eval $(dircolors -b /etc/DIR_COLORS)


#if [ $TERM = 'xterm' ] || [ $TERM = 'xterm-color' ]; then
#    export PROMPT_COMMAND='echo -ne "\033]2;Terminal:`pwd`\007"'
#fi

# pimp my grep
#export GREP_OPTIONS='--color=auto'
#export GREP_COLOR='1;31'

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

if [ "$TERM" == "xterm-256color" ]
then
    #
    # bind keys for cool stuff
    #
    bind Space:magic-space
    #auto complete symlinks including slash
    bind 'set mark-symlinked-directories on'
    /home/hernandezjj/bin/motd 1>&2
fi

