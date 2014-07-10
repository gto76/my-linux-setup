# Loads my personal aliases.
if [ -f ~/.bashrc-personal ]; then
	. ~/.bashrc-personal
fi
# Loads useful public aliases.
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Keyboard layouts with additional keybindings, see README.md.
alias us='setxkbmap -layout us; xmodmap ~/.Xmodmapus'
alias usvi='setxkbmap -layout us; xmodmap ~/.Xmodmapusvi'
alias si='setxkbmap -layout si; xmodmap ~/.Xmodmapsi'

# Syntax highligh for less
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '


###################################################
# ALIASES FOR EASY AND QUICK ACCESS TO THE FILES: #
#  .bashrc,  .bash_aliases,  WTF MAN, and  TOD0   #
###################################################

# Location of text file with useful unix command descriptions.
export HUD="$HOME/Desktop/WTF-MAN"
# Location of text file with general configuration and instalation instructions.
export INS="$HOME/Desktop/INSTALL"
# Location of TOD0 text file.
export TODO="$HOME/Desktop/TODO"

# Opens file in less.
alias m1='m "$HUD"'
alias m2='m $HOME/.bash_aliases'
alias m3='m $HOME/.bashrc'
alias m4='m "$INS"'
alias m5='m "$TODO"'
# Opens file in nano.
alias n1='n "$HUD"'
alias n2='n $HOME/.bash_aliases'
alias n3='n $HOME/.bashrc'
alias n4='n $HOME/my-aliases/Desktop/ETC'
alias n5='n "$TODO"'
alias nnn='n "$HUD" $HOME/.bash_aliases $HOME/.bashrc "$TODO"'
# Opens file in vim.
alias v1='v "$HUD"'
alias v2='v $HOME/.bash_aliases'
alias v3='v $HOME/.bashrc'
alias v4='v $HOME/my-aliases/Desktop/ETC'
alias v5='v "$TODO"'
# Opens file in gedit.
alias g1='g "$HUD" &'
alias g2='g $HOME/.bash_aliases &'
alias g3='g $HOME/.bashrc &'
alias g4='g $HOME/my-aliases/Desktop/ETC'
alias g5='g "$TODO" &'
alias ggg='gedit "$HUD" $HOME/.bash_aliases "$TODO" &'
# Greps file for passed phrase.
alias c1='m1 | c | gr'
alias c2='m2 | c | gr'
alias c3='m3 | c | gr'
alias c4='m4 | c | gr'
alias c5='m5 | c | gr'

# Append line to TOD0 file. 
alias zt='ztodo'
ztodo() {
    echo "$@" >> "$TODO"
}
# Append line to WTF-MAN file.
zhud() {
    echo "$@" >> "$HUD"
}

alias tz='tail "$TODO"'
