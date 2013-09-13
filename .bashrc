# Make some possibly destructive commands more interactive.
alias rmdir='rm -rI'
alias cpdir='cp -arv'

alias rm='rm -i'
alias mv='mv -iv'
alias cp='cp -iv'

alias less='less -Q~P%db/%D'
alias e='echo'

#LS
# Add some easy shortcuts for formatted directory listings and add a touch of color.
alias ls='ls -FXC --color=auto --group-directories-first'

alias listShort='ls'
#listShort() {
#  echo "executing: ls $*"
#	ls $*
#}
alias listMed='ls -lGgh --time-style="+%b %d %Y %H:%M"'
alias listLong='ls -l'

listShortLess() { 
  listShort --color=always $* | less -R+G
}
listMedLess() { 
  listMed --color=always $* | less -R+G 
}
listLongLess() { 
  listLong --color=always $* | less -R+G 
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


#???
#c() {
#  builtin "$*"
#  RESULT=$?
#  if [ "$RESULT" -eq 0 ]; then
#    l
#  fi
#}

find1() {
	tmp=`find . | grep --color=always "$1"`
	noOfLines=`echo "$tmp" | wc -l`
	if [ $LINES -gt $noOfLines ]; then
		echo "$tmp"
	else
		echo "$tmp" | less -R    
	fi
}


# Make grep more user friendly by highlighting matches
# and exclude grepping through .svn folders.
alias grep='grep --color=auto --exclude-dir=\.svn'

alias ...='cd ../..'
alias ..='cd ..'
alias .='echo $PWD'
alias p='echo $PWD'
alias cd..='cd ..'

alias canhaz='sudo apt-get install'
alias update='sudo apt-get update'
apropos1() {
	apt-cache search $*
}

alias clr=clear

alias his=history
alias h='history | grep '
alias pse='ps -e | grep $1'
alias df='df -h'
alias path='echo -e ${PATH//:/\\n}'

alias ch='chmod u+x'


##TEXT
alias c='cat'
alias m='less'
alias n='nano'
alias g='gedit'
alias more='less'

#Open last modified file in pico
alias Pico="pico `ls -t | head -1`" 

#open cat or less, depending on no of lines of file
catOrLess() {
	noOfLines=`cat "$1" | wc -l`
	if [ $LINES -gt $noOfLines ]; then
		cat "$1"	
	else
		less "$1" 
	fi
}

alias gg='gedit $HOME/.bashrc &'
alias tz='gedit "$TODO" &'
alias htu='gedit "$HUD" &'
alias ggg='gedit "$HUD" $HOME/.bashrc &'

#make bash script , make it executable, and open it in gedit
bs() {
	fName="$1.sh"
	touch "$fName"
	chmod u+x "$fName"
	gedit "$fName"
}


alias tar1='tar xvf'
alias tarz='tar xzvf'

#bash
alias b='bash'
sg() {
	sudo gedit "$*"
}

#count number of lines in files with extension $1
noOfLines() {
	no=0
	for file in *; do
		if [[ $file == *."$1" ]]; then
			let no=$no+`cat "$file" | wc -l`	
		fi
	done 
	echo $no
}


# NETWORKING
alias f='firefox'
alias ping1='ping -c 4 www.google.com'
alias ping2='ping -c 4 192.168.0.1'
alias mac='ifconfig | grep HWaddr'
alias dell='ssh jure@gto76.no-ip.biz'

#whats my internal ip - ifconfig
alias ip1='echo `/sbin/ifconfig | grep "inet addr:192.168" | grep -o addr:[0-9.]* | grep -o [0-9.]*`'

#whats my external ip - ifconfig
alias ip2='echo `lynx --dump http://ipecho.net/plain | grep -o [0-9.]*`'

#how many people on network beside you (number of hosts)
noh() {
	if [ $# -gt 0 ]
	then
		forth="$1"
	else
		forth="254"
	fi
	thirdNumberOfIp=`ip1 | sed -e :a -e 's/[0-9]*.\([0-9]\).[0-9]*.[0.9]*/\1/;ta'`
	command="nmap -sP 192.168.$thirdNumberOfIp.0-$forth"
	noOfHosts=`$command | grep -o "[0-9]* hosts up" | grep -o [0-9]*`
	noOfOtherUsers=`expr $noOfHosts - 2`
	echo $noOfOtherUsers
}

alias noh1='noh 10'

#scans local network
nmap1() {
  if [ $# -eq 0 ]
  then
    third=`ip1 | sed -e :a -e 's/[0-9]*.\([0-9]\).[0-9]*.[0.9]*/\1/;ta'`
    forth="254"
  fi
  if [ $# -eq 1 ]
  then
    third=`ip1 | sed -e :a -e 's/[0-9]*.\([0-9]\).[0-9]*.[0.9]*/\1/;ta'`
    forth="$1"
  fi
  if [ $# -gt 1 ]
  then
    third="$1"
    forth="$2"
  fi
  nmap -sP 192.168.$third.0-$forth
}

alias nmap2='nmap1 10'

#plays song in background
spilej() {
	if [ -f "$1" ]
	then
		echo "obstaja file"
		mplayer -slave "$@" &> /dev/null &
	else
		echo "ne obstaja file - iscem"
		mplayer "`	locate ".*$*.*mp3" --regex --quiet --ignore-case --limit 1 | sed 's/\(.*\)\r/"\1"/g'  `" &> /dev/null
	fi
}

#ZAPISKI
export TODO="/home/minerva/Desktop/TODO"
export HUD="/home/minerva/Desktop/HUDI TERMINAL UKAZI"
export TMP="/home/minerva/Desktop/tmp"
export TORD="/home/minerva/Desktop/toread"

#Append line to todo file
alias zt='ztodo'
ztodo() { 
	echo "$@" >> "$TODO" 
}
#Append line to HUDI TERMINAL UKAZI file
zhud() { 
	echo "$@" >> "$HUD" 
}
#Append line to tmp file
ztmp() { 
	echo "$@" >> "$TMP" 
}
#Append line to toread file
ztord() { 
	echo "$@" >> "$TORD" 
}
#write out zapiksi
alias ctodo='catOrLess "$TODO"'
alias chud='catOrLess "$HUD"'
alias ctmp='catOrLess "$TMP"'
alias ctord='catOrLess "$TORD"'

#git
alias gitc='git commit -am "standard"'


#shutdown
alias hib='sudo pm-hibernate'
alias sus='sudo pm-suspend'

# Specific
alias books="mc $HOME/Desktop/Computers"
alias d='cdd'
alias cdd='cd /media/sda3'

export DELL="gto76.no-ip.biz"
export TORRENTS="/media/sda3/torentz"
export MUSIC="/media/sda3/music"


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


