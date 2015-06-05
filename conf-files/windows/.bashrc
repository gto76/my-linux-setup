#!/bin/bash

#    _               _              _ _                     
#   | |__   __ _ ___| |__      __ _| (_) __ _ ___  ___  ___ 
#   | '_ \ / _` / __| '_ \    / _` | | |/ _` / __|/ _ \/ __|
#  _| |_) | (_| \__ \ | | |  | (_| | | | (_| \__ \  __/\__ \
# (_)_.__/ \__,_|___/_| |_|   \__,_|_|_|\__,_|___/\___||___/
#


set -o vi


###################################################
# ALIASES FOR EASY AND QUICK ACCESS TO THE FILES: #
#         .bashrc, WTF-MAN, NYK and INS           #
###################################################

# Location of text file with useful unix command descriptions.
export MAN="$HOME/my-aliases/textfiles/WTF-MAN"
# Location of text file with general configuration and instalation instructions.
export INS="$HOME/my-aliases/textfiles/INS"
# Location of TOD0 text file.
export NYK="$HOME/my-aliases/textfiles/NYK"

# Quick access files enumeration
QUAFE="1:$MAN;\
	2:$HOME/.bashrc;\
	3:$INS;\
	4:$NYK;\
"

SAVE_IFS="$IFS"
IFS=$'\n'
for pair in `echo "$QUAFE" | tr -d '\t' | tr ';' '\n'`; do
	i=`echo $pair | sed 's/:.*$//'` # index
	file=`echo $pair | sed 's/^.*://'`

	# Opens file in less.
	alias m"$i"="m $file"
	# Opens file in nano.
	alias n"$i"="nano $file"
	# Opens file in vim.
	alias v"$i"="v $file"
	# Opens file in gedit.
	alias g"$i"="g $file &"
	# Greps file for passed phrase.
	alias c"$i"="m$i | c | gr"
	# Appends line to file.
	alias a"$i"="echo $@ >> $file"
	# Print what file does the number represent
	alias w"$i"="echo $file"

done
IFS="$SAVE_IFS"

########
# LESS #
########

# Run less with: ignore case when searching, do not ring a bell, do not mark empty lines with ~, format prompt as 'page number'/'all pages' 'filename', set tabs to 4 spaces.
alias less='less --ignore-case --QUIET --tilde -P"%db/%D %f" --tabs=4'

# Open cat or less, depending on no of lines of file or input.
catOrLess() {
	if [ $# -gt 0 ]
	then
		noOfLines=`cat "$1" 2>/dev/null | wc -l`
		if [ $LINES -gt $noOfLines ]; then
			cat "$1"	
		else
			less "$1" 2>/dev/null 
		fi
	else
		input=`cat`
		noOfLines=`echo "$input" | wc -l`
		if [ $LINES -gt $noOfLines ]; then
			echo "$input" | cat	
		else
			echo "$input" | less 2>/dev/null 
		fi
	fi
}
alias m='catOrLess'

# Open cat or less +G (starts at the end of file), depending on no of lines of file or input.
catOrLessG() {
	if [ $# -gt 0 ]
	then
		noOfLines=`cat "$1" 2>/dev/null | wc -l`
		if [ $LINES -gt $noOfLines ]; then
			cat "$1"	
		else
			cat "$1" | less +G 2>/dev/null
		fi
	else
		input=`cat`
		noOfLines=`echo "$input" | wc -l`
		if [ $LINES -gt $noOfLines ]; then
			echo "$input" | cat	
		else
			echo "$input" | less +G 2>/dev/null
		fi
	fi
}
alias mEnd='catOrLessG'


######
# LS #
######

# All other ls aliases end up calling this one. It runs ls with: append indicator, sort alphabetically by extension, list by columns, use color when stdout is connected to terminal, group directories before files.
alias ls1='ls --classify -X -C --color=auto'

# Calls ls1 with: assumes screen width to be 80, so there aren't too many columns.
alias listShort='ls1 --width=80'
# Calls ls1 with: use long listing format, do not print groups, do not list owner, print sizes in human readable format, print date as: 'month by word, day of month, year, hour:minute'.
alias listMed='ls1 -l --no-group -g --human-readable'
# Calls ls1 with: use long listing format. 
alias listLong='ls1 -l'

# Functions that call aliases above, and pipe output to less. They override color option of ls to always and add RAW-CONTROL-CHARS option to less alias. This enables the transfer of colors from ls to less. Also start less at end of file.
listShortLess() { 
  listShort --color=always $* | less --RAW-CONTROL-CHARS +G
}
listMedLess() { 
  listMed --color=always $* | less --RAW-CONTROL-CHARS +G 
}
listLongLess() { 
  listLong --color=always $* | less --RAW-CONTROL-CHARS +G 
}

# This functions decide weather they will call basic or less version of the listShort/Med/Long function. It depends on whether the output of ls will fit on screen.
l() {
	noOfLines=`listShort "$@" 2> /dev/null |  wc -l`
	if [ $LINES -gt $noOfLines ]; then
		listShort "$@"	
	else
		listShortLess "$@" 
	fi
}
alias k='l'
ll() {
	noOfLines=`listMed "$@" 2> /dev/null | wc -l`
	if [ $LINES -gt $noOfLines ]; then
		listMed "$@"
	else
		listMedLess "$@"    
	fi
}
lll() {
	noOfLines=`listLong "$@" 2> /dev/null | wc -l`
	if [ $LINES -gt $noOfLines ]; then
		listLong "$@"
	else
		listLongLess "$@"    
	fi
}

# Variations of above function, that also display hidden files, but not . and ..
alias la='l --almost-all'
alias lla='ll --almost-all'
alias llla='lll --almost-all'
# Variations, that list directory entries instead of contents.
alias dl='l --directory'
alias dll='ll --directory'
alias dlll='lll --directory'
# Variations that sort files by date
alias lt='l -t'
alias llt='ll -t'
alias lllt='lll -t'
# Variations of listShort that list one entry per line.
alias l1='l -1'
alias la1='la -1'
# Display tree structure of folders belove PWD
tree1() {
	tree -C -I .git --dirsfirst "$@" | catOrLess
}
alias t='tree1'
# Same, but all files
alias tree2='tree1 -a'
alias t1='tree2'


##########
# BASICS #
##########

# Make some possibly destructive commands more interactive.
alias rmdir='rm -rf'
alias rmd='rmdir'
alias cpdir='cp -arv'
alias rm='rm -i'
alias rm1='rm'
alias mv='mv -iv'
alias cp='cp -iv'
alias mvdir='mv'

# Simplify going up in directory hierarchy.
alias cd..='cd ..'
alias ..='cd ..'
alias ,,='cd ..'
alias ...='cd ../..'
alias ....='cd ..; cd ..; cd ..;'
alias .....='cd ..; cd ..; cd ..; cd..'
alias ......='cd ..; cd ..; cd ..; cd..; cd..'
alias .......='cd ..; cd ..; cd ..; cd..; cd..; cd..'
alias ..l='cd ..; l'
# Combine cd and ls.
cdl() {	
	cd "$@"; l
}
alias .='echo $PWD'
# If no file specified, print PWD, else full path of the file.
p() {
	if [ $# -eq 0 ]; then
		echo "$PWD"
	else
		echo `echo "$PWD"`/"$@"
	fi		
}

alias ba='bash'
alias e='echo'
# Echo with backslash escapes (\n,...)
alias ee='echo -e'
# Echo withouth new line at the end.
alias en='echo -n'
alias c='cat'
# Vim - open one tab per file
alias v='vim -p'
# Read only vim
alias vv='view'
# Nano with: enable experimental undo (will most probably crash if going deeper than first undo level), autoindent, constantly show the cursor position, log search and replace strings, enable edit of multiple files, treat punctuation as part of words, smooth scrolling, tab size is 4 spaces.
alias n='nano --undo --autoindent --const --historylog --multibuffer --wordbounds --smooth --tabsize=4'
g() { gedit "$@" & }
alias fire='firefox &'
chrome() { google-chrome "$@" &> /dev/null & }
i() { google-chrome "$@" &> /dev/null & }
alias sub='sublime_text &'
alias scr='screen'
alias clr='clear'
alias his='history | catOrLessG'
alias h='history | grep '
alias xx='exit'
alias he='head'
alias he1='head -n1'
alias ta='tail'
alias ta1='tail -n1'
alias wcl='wc -l'
alias wcw='wc -w'
# Force remove
alias rm1='rm -f'
# Console calculator with float.
alias bc1='gcalccmd'
alias mk="make"
# Report disk space of main partitions in human readable form.
alias df1='df -h | grep "sd\|Size" | cat'
# Open pdf file
pdf() { evince $@ & }
# Set volume in console for all audio channels.
alias mixer='alsamixer'
# Get keycode for pressed key.
alias keycode='xev';
# Execute command periodically every 2 seconds. Aliases can be also used.
alias watch1='watch bash -i -c'
# Every 10 seconds.
alias watch2='watch -n 10 bash -i -c'
# 30 seconds.
alias watch3='watch -n 30 bash -i -c'
# Open picture in console as ascii art.
alias asci='asciiview'
# Set keyboard layout to us and run xmodmap.
alias resetkey='setxkbmap -layout us; xmodmap ~/.Xmodmap'
alias resetkeys='resetkey'
# Display disk space used by a folder or a file in human readable form.
alias du='du --summarize --human-readable'
# Set bash to vi mode.
alias vimode='set -o vi'
# Start a new terminal.
alias gt='gnome-terminal'
alias term='gnome-terminal'
# Start a file explorer
alias f='nemo .'
# Update files db
alias updatedb='sudo updatedb'
# Get name of first file in directory
alias first='ls | head -1'
# Get name of random file in directory
alias random-file='ls | sort -R | head -1'
alias rf='random-file'
# Run profile script
alias profile='source /etc/profile'


########
# SUDO #
########

alias srm='sudo rm -i'
alias scp='sudo cp -iv'
alias smv='sudo mv -iv'

sg() { 
	sudo gedit "$*" 
}
sn() {
	sudo nano -icHFwST 4 "$*"
}
sm() {
	sudo less "$*"
}
sv() {
	sudo vim "$*"
}


#######
# GIT #
#######

commit() {
  if [ $# -eq 0 ]
  then
    message="regular commit"
  else
  	message="$*"
  fi
  git commit -am "$message"
}
alias push='git push'
alias pull='git pull'
alias checkout='git checkout'
alias merge='git merge'

alias gs='git status'
# Nicely decorated graph of commits
alias gl='git log --decorate --graph --all'
alias gl1="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
alias gl2="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
# Update information about state of the origin.
alias gu='git remote update'
alias gd='git diff'
alias ga='git add'
alias gm='git mv'
alias gll='git ls-files'

# GIT MISC:

# Push every project in the directory
pushall() {
	for a in *; do 
		(if [ -d "$a" ]; then 
			cd $a 
			echo "$a" 
			git push 
		fi) 
	done
}

# For all projects in the directory print the labaels of the last commit
alias gsta='for a in *; do if [[ -d "$a" ]]; then cd "$a"; echo "$a"; git remote update; git log --decorate | head -1; echo; cd ..;fi ; done'

# Displays lines of code per file in git repo and sum of all. Only looks for files in src directory.
gloc() {
	git ls-files \
		| xargs file \
		| grep text \
		| grep -o ^.*: \
		| tr -d ":" \
		| grep ^src/.* \
	  	| xargs wc -l 
}

# Runs gloc in all subfolders and only displays totals.
glocall() {
	sum=0
	for a in *; do 
		if [ -d "$a" ]; then 
			cd "$a"
			tot=`gloc | grep total | grep -o [0-9]*`
			if [ -n "$tot" ]; then
				echo "$a"
				echo "$tot"
				let sum=$sum+"$tot"
			fi
			cd ..
		fi
	done
	echo "============="
	echo "$sum"
}

# Plot distribution of file lengths in git repo. Gnuplot and gnuplot-x11 packages need to be installed.
giplot() {
	gitl | head -n-1 | sort -n | grep -o '^ *[0-9]* ' | tr -d ' ' > /tmp/gitlTmpFile 
	echo "unset key; plot '/tmp/gitlTmpFile'" | gnuplot -p 
	\rm /tmp/gitlTmpFile
}

