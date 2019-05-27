# .bashrc                                                                       

# Source global definitions                                                     
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:                                                                              
# export SYSTEMD_PAGER=                                                         

# User specific aliases and functions                                           
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$PYENV_ROOT/versions/anaconda3-5.0.1/bin/:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# just processed in non-login shells
if [ ! -n "$SSH_CLIENT" -o -n "$SSH_TTY" ] ; then

# shell variables
HISTSIZE=10000
HISTFILESIZE=70000
HISTCONTROL=ignoreboth
IGNOREEOF=3
SSMODE=flow

# envs
export LANG=ja_JP.UTF-8
export EDITOR=mg
export PAGER='less -r'
export LESS='-M -X'
export OMP_NUM_THREADS=4

TTYNAME=`who -m | tr -s ' ' | cut -d' ' -f2`

GPG_TTY=$(tty)
export GPG_TTY

# prompt setting
PS1='\W$ '
unset PROMPT_COMMAND

#============================================================
#
#  ALIASES AND FUNCTIONS
#
#  Arguably, some functions defined here are quite big.
#  If you want to make this file smaller, these functions can
#  be converted into scripts and removed from here.
#
#============================================================

# Creates an archive (*.tar.gz) from given directory.
function mktar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function mkzip() { zip -r "${1%%/}.zip" "$1" ; }

alias la='ls -a'
alias lt='ls -ltrh'
alias al='alias'
alias cl='clear'
alias tv=$PAGER
alias sr='screen'
alias j='jobs'
alias x='exit'
alias em='emacs'
alias emn='emacs -nw'
alias kill-emacs="emacsclient -e '(kill-emacs)'"
alias mat='matlab -nodesktop'
alias rxn='urxvt -fg gray70 -bg black'
alias rxd='urxvt -fg black -bg gray70'
alias rxg='urxvt -fg black -bg DarkSeaGreen'
alias rxb='urxvt -fg black -bg LightSteelBlue'
alias rxk='urxvt -fg black -bg DarkKhaki'
alias rx0='urxvt'
alias rx1='urxvt -fg gray70 -bg black'
alias rx2='urxvt -fg black -bg gray70'
alias rx3='urxvt -fg black -bg LightSteelBlue'
alias rx4='urxvt -fg black -bg DarkSeaGreen'
alias rx5='urxvt -fg black -bg DarkKhaki'

## functions
function dup { if [ ! -f $1.orig ]; then mv $1 $1.orig; cp $1.orig $1; fi;}
function ec { emacsclient $* & }
function gv { evince $* & }
function oo { soffice $* & }
function ov { soffice --view $* & }
function ds { diff -bu $1~ $1;}
function wctex { sed -e 's/%.*$//' $1 | wc;}
function ctfinfo { dsinfo $1 | sed -e '/Filter Test/,$d';}
function e2p { eps2png -png -resolution 108 $1;}
function e2pall {
    for i in *.eps; do
        if [ $i -nt ${i%.eps}.png ]; then
            echo $i
            eps2png -png -resolution 108 $i
        fi
    done
}
fi

## Environment
export PATH="$PATH:/home/your_user/.local/bin"
export EDITOR='emacs'
alias gmo='nvidia-smi dmon -s pu -d 5'
alias l='printf "\033[8;48;80t"' #?,height,width, 
alias w='printf "\033[8;24;160t"' #?,height,width
alias lw='printf "\033[8;48;160t"' #?,height,width
alias wl='printf "\033[8;48;160t"' #?,height,width
alias ds='printf "\033[8;24;80t"' #?,height,width
alias mx='printf "\033[8;52;211t"' #?,height,width
# 211,52, BenQ 21.5 inch
# C code
# printf: output
# \033: written in 8 shinnsuu (octal notation), Escape sequence in strings
# $LINES, $COLUMS,,,, export,,,
# I can't understand.

alias bup='cp -druv'
alias df='df -h'
alias men3='source ~/.bash_profile'
alias ipy3='men3; ipython'
alias jq3='men3; jupyter qtconsole'
alias jc3='men3; jupyter console'
alias men='source ~/envs/py2/bin/activate'
# alias ipy='men; ipython'
alias ipy='ipython'
alias jq='men; jupyter qtconsole'
alias jc='men; jupyter console'
alias ge='gedit'
alias de='deactivate'
alias pdf='acroread'

## EOF

