# Make some possibly destructive commands more interactive.
alias rm='rm -i'
alias mv='mv -iv'
alias cp='cp -iv'

alias less='less -Q'
 
# Add some easy shortcuts for formatted directory listings and add a touch of color.
alias ls='ls -AFXC --color=auto --group-directories-first'

alias listShort='ls'
#listShort() {
#  echo "executing: ls $*"
#	ls $*
#}
alias listMed='ls -lGgh --time-style="+%b %d %Y %H:%M"'
alias listLong='ls -l'

listShortLess() { 
  listShort --color=always $* | less -R 
}
listMedLess() { 
  listMed --color=always $* | less -R 
}
listLongLess() { 
  listLong --color=always $* | less -R 
}

l() {
	noOfLines=`listShort "$@" | wc -l`
	if [ $LINES -gt $noOfLines ]; then
		listShort "$@"	
	else
		listShortLess "$@" 
	fi
}
ll() {
	noOfLines=`listMed "$@" | wc -l`
	if [ $LINES -gt $noOfLines ]; then
		listMed "$@"
	else
		listMedLess "$@"    
	fi
}
lll() {
	noOfLines=`listLong "$@" | wc -l`
	if [ $LINES -gt $noOfLines ]; then
		listLong "$@"
	else
		listLongLess "$@"    
	fi
}

c() {
  builtin "$*"
  RESULT=$?
  if [ "$RESULT" -eq 0 ]; then
    l
  fi
}


# Make grep more user friendly by highlighting matches
# and exclude grepping through .svn folders.
alias grep='grep --color=auto --exclude-dir=\.svn'

alias ...='cd ../..; ls'
alias ..='cd ..; ls'
alias .='echo $PWD'
alias p='echo $PWD'
alias cd..='cd ..'

alias canhaz='sudo apt-get install'

alias cls=clear

alias his=history
alias pf='ps -e | grep $1'
alias h='history | grep '
alias df='df -h'
alias path='echo -e ${PATH//:/\\n}'



alias more='less'
alias mo='less'
alias m='less'

alias b='bash'

alias Pico="pico `ls -t | head -1`" #Open last modified file in pico

# Networking
alias ping1='ping -c 4 www.google.com'
alias ping2='ping -c 4 192.168.0.1'
alias mac='ifconfig | grep HWaddr'

# Specific
alias books="mc $HOME/Desktop/Computers"

#########
#mashups#
#########
alias nba='lynx http://scores.nbcsports.msnbc.com/nba/scoreboard.asp'
#LPP
alias lpp='lynx http://bus.talktrack.com/'
#lynx -cmd_script=lppScript http://bus.talktrack.com/ > /dev/null


#linxUberSkriptInterpreter(String source) {
#  outScr=""
#  za vsako vrstico com = ...
#    if $com="up"
#    then
#      outScr=$outScr+"key up\n"
#    fi
    #up
    #down
    #left
    #right
    #string
#      for all leters letter = ...
#        outScr=$outScr+"key $letter"
#
#  return outScr
#}



#STACK OVERFLOW
alias so='stack'
stack() {

  if [ $# -eq 0 ]
  then
    url='http://stackoverflow.com/'
  fi

  if [ $# -eq 1 ]
  then
    url="http://stackoverflow.com/search?q=$1"
  fi

  if [ $# -gt 1 ]
  then
    url="http://stackoverflow.com/search?q=$1"
    i=0
    for var in "$@"
    do
      if [ $i -gt 0 ]
      then
        url=$url+$var
      fi
      let i=$i+1
    done
  fi

  eval "lynx $url"
}

#wiki() { dig +short txt "$*".wp.dg.cx; }
#function wiki() #check wikipedia
#{ dig +short txt "${@}".wp.dg.cx | awk 'BEGIN{RS="\" \"";ORS=""} // {gsub("\"",""); sub("htt","\nhtt"); print}';}

wiki() {

  if [ $# -eq 0 ]
  then
    url='http://en.wikipedia.org/wiki/'
  fi

  if [ $# -eq 1 ]
  then
    url="http://en.wikipedia.org/wiki/$1"
  fi

  if [ $# -gt 1 ]
  then
    url="http://en.wikipedia.org/wiki/$1"
    i=0
    for var in "$@"
    do
      if [ $i -gt 0 ]
      then
        url="${url}_${var}"
      fi
      let i=$i+1
    done
  fi

  eval "lynx $url"
}


#from net:
alias kdox='mplayer http://wms2.mainstreamnetwork.com/kdox-am &'
alias wabc='mplayer http://69.28.128.148:80/stream/citadelcc_WABC-AM &'

