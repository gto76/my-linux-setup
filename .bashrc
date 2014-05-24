if [ -f ~/.bashrc2 ]; then
	. ~/.bashrc2
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

set -o vi
export EDITOR="vim"
 
export HUD="$HOME/my-aliases/Desktop/WTF MAN"

alias us='setxkbmap -layout us; xmodmap ~/.Xmodmapus'
alias si='setxkbmap -layout si; xmodmap ~/.Xmodmapsi'

alias wea1='weathr 531951'
alias wea2='weathr 530634'
alias wea='wea1; wea2'


