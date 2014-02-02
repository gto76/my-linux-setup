alias less='less -Q~P"%db/%D %f"'
  
#open cat or less, depending on no of lines of file or input
catOrLess() {
	if [ $# -gt 0 ]
	then
		noOfLines=`cat "$1" 2>/dev/null | wc -l`
		if [ $LINES -gt $noOfLines ]; then
			cat "$1"	
		else
			less "$1" 
		fi
	else
		input=`cat`
		noOfLines=`echo "$input" | wc -l`
		if [ $LINES -gt $noOfLines ]; then
			echo "$input" | cat	
		else
			echo "$input" | less 
		fi
	fi
}
alias n='catOrLess'

#open cat or less +G (starts at the end of file), depending on no of lines of file or input
catOrLessG() {
	if [ $# -gt 0 ]
	then
		noOfLines=`cat "$1" 2>/dev/null | wc -l`
		if [ $LINES -gt $noOfLines ]; then
			cat "$1"	
		else
			cat "$1" | less +G 
		fi
	else
		input=`cat`
		noOfLines=`echo "$input" | wc -l`
		if [ $LINES -gt $noOfLines ]; then
			echo "$input" | cat	
		else
			echo "$input" | less +G 
		fi
	fi
}
alias nEnd='catOrLessG'

# LS

# Add some easy shortcuts for formatted directory listings and add a touch of color.
alias ls1='ls -FXC --color=auto --group-directories-first'
alias listShort='ls1 -w 80'
alias listMed='ls1 -lGgh --time-style="+%b %d %Y %H:%M"'
alias listLong='ls1 -l'
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
	noOfLines=`listShort "$@" 2> /dev/null | wc -l`
	if [ $LINES -gt $noOfLines ]; then
		listShort "$@"	
	else
		listShortLess "$@" 
	fi
}
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
alias la='l -A'
alias lla='ll -A'
alias llla='lll -A'

# BASICS

# Make some possibly destructive commands more interactive.
alias rmdir='rm -rI'
alias cpdir='cp -arv'
alias rm='rm -i'
alias mv='mv -iv'
alias cp='cp -iv'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ..; cd ..; cd ..;'
alias .....='cd ..; cd ..; cd ..; cd..'
alias ......='cd ..; cd ..; cd ..; cd..; cd..'
alias .......='cd ..; cd ..; cd ..; cd..; cd..; cd..'

alias ,,='cd ..'
alias cd..='cd ..'
alias ..l='cd ..; l'
cdl() {	
	cd "$@"; l
}

alias .='echo $PWD'
p() {
	if [ $# -eq 0 ]; then
		echo "$PWD"
	else
		echo `echo "$PWD"`/"$@"
	fi		
}

alias ba='bash'
alias bax='exit; bash'
alias e='echo'
alias ee='echo -e'
alias en='echo -n'
alias c='cat'
alias m='nano -uicHFwST 4'
alias g='gedit'
alias f='firefox'
alias scr='screen'
alias t='date'
alias clr='clear'
alias his='history | catOrLessG'
alias h='history | grep '
alias xx='exit'
alias he='head'
alias he1='head -n1'
alias ta='tail'
alias ta1='tail -n1'
alias s='screen'
alias pgrep1='pgrep -l'
alias bc1='gcalccmd'
alias trd='tr -d'
alias table='column -t -s'
alias sub='sublime_text'
#alias v='vim'
alias v='vim -c "set nu" -c "set tabstop=4"'
alias ?="echo $?"
alias mk="make"

cut1() {
	cut -d "$1" -f "$2" 
}

sort1() { 
	sort -t "$1" -k "$2"
}

psM() {
	ps "$@" | catOrLess
}
alias ps='psM'
alias pse='ps -e | catOrLess'

alias df='df -h'

alias hib='sudo pm-hibernate'
alias sus='sudo pm-suspend'

alias du='du -sh'

alias gg='gedit $HOME/.bash_aliases &'

alias strace1='strace -s 2000 -f'

# SUDO
alias srm='sudo rm -i'
alias scp='sudo cp -iv'
alias smv='sudo mv -iv'

sg() {
	sudo gedit "$*"
}
sm() {
	sudo nano -icHFwST 4 "$*"
}
sn() {
	sudo less "$*"
}

# USEFUL

# Make grep more user friendly by highlighting matches
# and exclude grepping through .svn folders.
alias grep1='grep --color=auto --exclude-dir=\.svn --exclude-dir=\.git'
gr() {
	grep1 "$@" -iP --color=always | catOrLess
}
gr1() {
	egrep "$@" -i --color=always --exclude-dir=\.svn --exclude-dir=\.git | catOrLess
}


alias b='acpi'
alias battery='acpi'

alias canhaz='sudo apt-get install'
alias update='sudo apt-get update'
alias remove='sudo apt-get remove'
alias purge='sudo apt-get purge'

#make bash script , make it executable
bs() {
	fName="$1.sh"
	createExecutable "$fName"
}
#make bash script , make it executable, and open it in gedit
bsg() {
	fName="$1.sh"
	createExecutable "$fName"
	gedit "$fName"
}
#make bash script , make it executable, and open it in nano
bsn() {
    fName="$1.sh"
	createExecutable "$fName"
    n "$fName"
}

createExecutable() {
	touch "$1"
	chmod u+x "$1"        
}
alias ce=createExecutable
#make executeble
alias me=createExecutable    
            
alias tar1='tar xvf'
alias tarz='tar xzvf'

hd1() {
	hd "$*" | catOrLess
}

aproposM() {
	apropos "$*" | catOrLess
}
alias apropos='aproposM'
alias ap='apropos'

apropos1() {
	apt-cache search "$*" | catOrLess
}
alias ap1='apropos1'

alias wi1='whatis'
# Searches apt for name
whatis1() {
	apt-cache show "$*" | grep "^ " | catOrLess
}
alias wi2='whatis1'
# Searches aliases for name
whatis2() {
	type "$*" | catOrLess
}
alias wi3='whatis2'

wi() {
	call1=`whatis "$@" 2> /dev/null`
	if [ "$?" == "0" ]; then
		echo "$call1"
		return
	fi

	call2=`apt-cache show "$*" 2> /dev/null | grep "^ "`
	if [ "$?" == "0" ]; then
		echo "$call2"
		return
	fi

	call3=`type "$*" 2> /dev/null`
	if [ "$?" == "0" ]; then
		echo "$call3"
		return
	fi
}

#git
commit() {
  if [ $# -eq 0 ]
  then
    message="regular commit"
  else
  	message="$*"
  fi
  sudo git commit -am "$message"
}
alias push='sudo git push'
alias gits='git status | catOrLess'
alias gita='sudo git add src/*'

#go
alias run='go run'

find1() {
	tmp=`find . | grep --color=always "$1"`
	noOfLines	=`echo "$tmp" | wc -l`
	if [ $LINES -gt $noOfLines ]; then
		echo "$tmp"
	else
		echo "$tmp" | less -R    
	fi
}

mkdir1() {
	mkdir "$1"
	cd "$1"
}

sed1() {
	input=`cat`
	echo "$input" | sed "s/$1/$2/"
}

sed2() {
	input=`cat`
	echo "$input" | sed "s/$1/$2/g"
}

# Print clipboard
alias xo='xclip -o'
# Put in clipboard
alias xi='xclip -i'

# NOT_SO_NECESARY

alias path='echo -e ${PATH//:/\\n}'
alias ch='chmod u+x'

#display free memory
alias fr="free | grep Mem | sed 's/^[^ ]*[ ]*[^ ]*[ ]*[^ ]*[ ]*\([^ ]*\)[ ]*[^ ]*[ ]*[^ ]*[ ]*[^ ]*/\1/'"

# Count number of lines in files with extension $1 
# in current and sub directories.
noOfLines() {
	rootDir="$PWD"
	no=0
	for file in *; do
		if [ -d "$file" ]; then
			#echo "entering $file" >&2
			cd "$file"
			recRes=`noOfLines "$1"`
			#echo "recRes is $recRes" >&2
			let no=$no+"$recRes"
			cd "$rootDir"
		fi
		if [[ "$file" == *."$1" ]]; then
			let no=$no+`cat "$file" | wc -l`	
		fi
	done
	echo $no
}
alias loc='noOfLines'

# Open last modified file in nano
alias Nano="nano `ls -t | head -1`" 

# Print majority of commands
commands() {
	whatis `ls -1 /usr/share/man/man1/ | sed 's/\..*$//' | sed 's/-.*$//' |  sed 's/_.*$//' | uniq` 2>/dev/null | grep \(1\) | sed 's/(1)//' | grep -v DOS -i | grep -v anymap | grep -v ppm | m
}

# Size of a command
bsize() {
	loc=`which "$1"`
	if [ $? -eq 0 ]; then
		ls -Hlh "$loc" | sed 's/^[^ ]* [^ ]* [^ ]* [^ ]* \([^ ]*\).*/\1/'
	fi
}

alias picture='display'
alias image='display'
alias img='display'

#            #
# NETWORKING #
#            #

#wlan up/down
alias up='sudo ifconfig wlan0 up'
alias down='sudo ifconfig wlan0 down'

#get gateway
alias gateway='route -n | grep "192.168." | head -n1 | grep -o "192.168.[0-9.]*"'
#ping gateway
alias ping1='ping -c 4 `gateway`'
alias ping2='ping -c 4 8.23.224.107'
alias ping3='ping -c 4 www.google.com'
alias mac='ifconfig | grep HWaddr'


# Print countries on the route to host.
# Ex wget -qO- http://api.wipmania.com/"$ip"
traceroute1() {
	i=1
	echo -n "$@; "
	traceroute "$@" | while read line
	do
		if [ $i -gt 2 ]; then
		
			url=`echo "$line" | sed -r 's/^[ ]*[0-9]+  ([^ ]+) .*$/\1/'`
			cc=`echo "$url" | grep -o '\.[a-z][a-z][ ]*$' | tr -d '.' | tr 'a-z' 'A-Z'`
			
			if [ $i -eq 3 ]; then
				echo -n "$url; "
			fi

			if [[ "$cc" != "" && "$cc" != "EU" ]]; then
				countryN="$cc"
			else
				countryN=`echo "$url" | urlToCountry | sed -r 's/.*\.([a-z][a-z])\.geant\.net/\1/'`
			fi

			isIp=`echo "$countryN" | grep -P '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'`
			if [ "$isIp" != "" ]; then
				countryN="$countryO"
			fi
		
			if [ "$countryN" != "$countryO" ]; then
				if [ $i -gt 3 ]; then
					echo -n " > "
				fi
				if [ "$countryN" == "" ]; then
					echo -n "??"
				else 
					echo -n "$countryN"
				fi
				countryO="$countryN"
			fi			
			
		fi
		let i=$i+1
		if [ $i -gt 31 ]; then
			echo -n " > .."
		fi	
	done
	echo
}

urlToCountry() {
	input=`cat`
	echo "$input" | 
	callSed DE gw-hetzner fra frankfurt ffm frnk frf "f\.de" hbg nue Dusseldorf Berlin |
	callSed AT win wien vienna vie grz |
	callSed CZ prag |
	callSed US Houston 10ge4-2\.core1\.slc1\.he\.net ace-data-centers-inc\.10gigabitethernet1-4\.core1\.slc1\.he\.net -orl- -dc- "\.usa\." "\.us\." den nyc nyk NewYork ash asb chi chichago wdc Washington dal dlls sjo SanJose sjc phx phoenix atl mia mai lax [^t]las LosAngeles sttl |	#New York
	callSed GB "\.us\." lon ldn lnd |
	callSed DK kbn cop dk-| 
	callSed FR "\.fr\." par prs Paris mrs mei Marseille mars |
	callSed NE ams adm amd |
	callSed BU sfia |
	callSed HU szekesfehervar |
	callSed PL poz pzn poznan Warsaw | 
	callSed NL amsterdam |
	callSed BA travnik |
	callSed HU bud bpt Budapest |
	callSed JP osak tok |
	callSed TZ dar | 
	callSed IN mba | 
	callSed MZ mpm | 
	callSed PT lis | 
	callSed ES mad bcn |
	callSed IT mil Milan rom palermo |
	callSed SG sng sing \.sg\. | 
	callSed BE Brussels belnet |
	callSed EE tal | 
	callSed LV rig latvija | 
	callSed CA Montreal | 
	callSed LT kau | 		
	callSed GR ath |	
	callSed IE Dublin |
	callSed AU nsw |	
	callSed RU spb |	
	callSed RO buc roedu |	
	callSed ZA mtz |	
	callSed CL Santiago |	
	callSed CA tor |		
	callSed CN macau | 	
	callSed AR bue baires | 
	callSed CI IRVOCA |
	callSed DJ dji | 
	callSed SI siol |
	callSed KZ Kaza | 
	callSed LU lxb | 
	callSed CY cypr | 
	callSed LK srilanka |
	callSed BM north-rock-communications
	callSed HR zag |
	callSed IS is- |
	callSed IL bezeqint |
	callSed JM flowja |
	callSed CH zrh [^r]gen |
	callSed LY libia |
	callSed SK \.sk\. |
	callSed SE se- |
	callSed TR \.tr\. |
	callSed  |
	callSed  |
	callSed
	# te2-2.ccr01.zag01.atlas.cogentco.com -> US!!!
	#./callSed.sh CH gen | #ARGENTINA!
}

callSed() {
	input=`cat`
	i=1
	for arg in "$@"; do
		if [ $i -gt 1 ]; then
			input=`echo "$input" | sed "s/[^ ]*$arg[^ ]*/$1/I"`
		fi
		let i=$i+1
	done
	echo "$input"
}

# Prints urls of universities, one per country
universities() {
	# get all country codes from index site, together with country name
	wget -qO - http://univ.cc/world.php | grep -o 'option value=\"[a-z]*\">[A-Za-z ]*(' | grep -o \".* | tr -d "\"" | tr -d "(" | while read ccc
	do
		country=`echo $ccc | sed 's/>.*//'`
		countryName=`echo $ccc | sed 's/.*>//'`
		if [ "$country" != "world" ]; then
			# use them to get to country subsites and print url of random university that has country code for tld
			urls=`wget -qO - "http://univ.cc/search.php?dom=$country&key=&start=1" | grep -o "'http:[^ ]*\.$country/[^ ]*'" | tr -d "'" | shuf`
			url=""
			while [ "$urls" != "" ]; do
				url=`echo "$urls" | head -n1`
				wget --timeout=3 --tries=1 -qO- "$url" >/dev/null
				if [ $? -eq 0 ]; then
					break
				fi
				urls=`echo "$urls" | tail -n +2`
			done
			
			if [ "$url" != "" ]; then
				echo "$countryName>$url"
			fi
		fi
	done
}

# Traceroute1 all countries.
www() {
	universities | while read nameAndUrl
	do
		countryName=`echo $nameAndUrl | sed 's/>.*//'`
		url=`echo $nameAndUrl | sed 's/.*>//' | sed 's/http://' | tr -d '/'`
		echo -n "$countryName; "
		echo -n `date --rfc-3339=seconds`
		echo -n "; "
		traceroute"$1" "$url"
	done
}

alias www1='www 1'

whois1() {
	whois "$@" | catOrLess
}
whois2() {
	whois "$@" | grep -i country
}

pingAll() {
	ping -c 1 -q `gateway` | grep --color=never -A 1 statistics
	ping -c 1 -q 8.23.224.107 | grep --color=never -A 1 statistics
	ping -c 1 -q www.google.com | grep --color=never -A 1 statistics
}
alias pa=pingAll
alias pa1='pingAll; pingAll'

#whats my internal ip - ifconfig
alias ip1='echo `/sbin/ifconfig | grep "inet addr:192.168" | grep -o addr:[0-9.]* | grep -o [0-9.]\*`'

#whats my external ip - ifconfig
alias ip2='echo `lynx --dump http://ipecho.net/plain | grep -o [0-9.]\*`'

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

# Shrani output od nmap1 v file poimenovan po trenutnem času
# [leto-mesec-dan-ura-minuta:teden v letu-dan v tednu]
networkLogger() {
	destDir="~/networkLogger"
	mkdir "$destDir"
	third=`/sbin/ifconfig | grep "inet addr:192.168" | grep -o addr:[0-9.]* | grep -o [0-9.]* | sed -e :a -e 's/[0-9]*.\([0-9]\).[0-9]*.[0.9]*/\1/;ta'`
	forth="20"
	nmap -sP 192.168.$third.0-$forth > "$destDir"/`date +%y-%m-%d-%H-%M:%W-%u`]
}

niceDisplay() {
	cd "~/networkLogger/logs"
	# For all uniqe host names,
	for n in `cat * | grep Host | sort | uniq | grep -v Gateway | sed 's/^Host \([^ ]*\).*$/\1/'`; do
		printf "$n:\t"
		# check every log file if it contains it
		for f in *; do
			cat "$f" | grep -q "$n"
			if [ $? -eq 0 ]; then
				# and print a * if it does.
				printf "*"
			else
				printf " "
			fi
		done
		echo ""
	done
}

#          #
# INTERNET #
#          #

alias lpp='lynx http://bus.talktrack.com/'

alias kdox='mplayer http://wms2.mainstreamnetwork.com/kdox-am &'
alias wabc='mplayer http://69.28.128.148:80/stream/citadelcc_WABC-AM &'

#nba
alias nbaScoreboard="lynx -dump -crawl http://scores.nbcsports.msnbc.com/nba/scoreboard.asp | grep -w 'PM' -A10 | grep -v 'STATS LLC\|Any commercial\|NBC Sports\|NBC Universal' | grep -v MST | sed 's/^.*ET\([0-9:]*\).*$/   \1/' | grep -v Preview | sed '/^$/N;/^\n$/D' | m"
alias nbaStandings="lynx -dump -crawl http://scores.nbcsports.msnbc.com/nba/standings_conference.asp | grep 'Eastern Conference' -A39 | gr _ -v | sed 's/New York/New=York/g' | sed 's/San Antonio/San=Antonio/g' | sed 's/Oklahoma City/Oklahoma=City/g' | sed 's/Trail Blazers/Trail=Blazers/g' | sed 's/Los Angeles/Los=Angeles/g' | sed 's/Golden State/Golden=State/g' | sed 's/New Orleans/New=Orleans/g' | sed 's/Conf GB/Conf=GB/g' | sed 's/Last 10/Last=10/g' | sed 's/\([0-9]*\) \([W\|L]\)$/\1=\2/g' | sed 's/W L/= = = W L/' | sed 's/Eastern Conference/€/g' | sed 's/Western Conference/ħ/g' | column -t | tr '=' ' ' | sed 's/€/Eastern Conference/' | sed 's/ħ/\nWestern Conference/' | m"

nba() {
	e -n '   ';	t; e 
	nbaScoreboard
}
alias nba1='e; nbaStandings; e'
alias nba2='lynx http://scores.nbcsports.msnbc.com/nba/scoreboard.asp'

#stack overflow
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

#super user
suser() {

  if [ $# -eq 0 ]
  then
    url='http://superuser.com/'
  fi

  if [ $# -eq 1 ]
  then
    url="http://superuser.com/search?q=$1"
  fi

  if [ $# -gt 1 ]
  then
    url="http://superuser.com/search?q=$1"
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

#wikipedia
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

#Shows weather for city specified by citycode defined by yahoo weather
weathr() {
	curl --silent "http://weather.yahooapis.com/forecastrss?w=$1&u=c" | awk -F '- '  '/<title>/ { sub("</title>", "", $2) && l=$2 }/<b>Forecast/ { getline; gsub("<.*", "", $2); printf("%s: %s\n", l, $2); exit }'
}

# For every input line it downloads first google image match and saves it in pwd
gimage() {
	cat | while read line
	do 
		gi1 "$line" > "$line"
		sleep 3
	done
}

gi1() {
	wget -qO- "http://images.google.com/images?q=$(echo "$@" | sed 's/ /+/g')" -U "Firefox on Ubuntu Gutsy: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1.14) Gecko/20080418 Ubuntu/7.10 (gutsy) Firefox/2.0.0.14" | 
	grep -o '<img[^>]*>' | 
	head -n1 | 
	grep "src=\"[^\"]*" -o | 
	sed 's/src=\"//' | 
	wget -i- -O-
}

gi() {
	gi1 "$@" 2> /dev/null | display &
}

#       #
# AUDIO #
#       #

#AUDIO PLAYER
#plays song (Downloads from youtube if nothing found localy)
#TODO doesen't fint file in filesystem
spilej() {
	if [ -f "$1" ]
	then
		echo "Playing \"$1\""
		mplayer -slave "$@" &> /dev/null
	#else if
		# TODO: check temp folder
		#foundFiles=`find /tmp/spilejYoutube/ -iname '*$1*.wav' -o -iname '*$1*.mp3'-o -iname '*$2*.mp3'-o -iname '*$2*.mp3'`
		#if [ $foundFiles == "" ]
	else
		#search filesystem
		#TODO check that it's not mp3.part file
		echo "No file in folder. Scanning filesystem..."
		listOfFiles=`locate ".*$*.*mp3" ".*$*.*wav" --regex --quiet --ignore-case`
		noOfFiles=`echo "$listOfFiles" | wc -l`
		if [ "$noOfFiles" -gt 1 ]
		then
			#echo "File found."
			let chosenNumber="$RANDOM"%"$noOfFiles"
			fileName=`echo "$listOfFiles" | sed "$chosenNumber!d" | sed 's/\(.*\)\r/"\1"/g' `
			echo "Playing \"$fileName\""
			mplayer "$fileName" &> /dev/null
		else
			echo "No file in filesystem. Searching Youtube..."
			spilejYoutube "$*"
		fi		
	fi
}

spilejYoutube() {
	#TODO More reliable search	
	#TODO MP4
	#TODO stop executing if one step fails
	cd ~/Music; mkdir spilejYoutube 2>/dev/null; cd spilejYoutube
	#zgeneriraj skripto in jo sprevi v tmp
	#echo "Generating search script."
	lynxYoutubeSkripta "$*" > spilejLinxSkripta
	#zazeni lynx z skripto
	#echo "Searching."
	lynx -cmd_script=~/Music/spilejYoutube/spilejLinxSkripta www.youtube.com &>/dev/null
	#uzami zadnji bookmark
	url=`cut --delimiter='"' -f 2 $HOME/lynx_bookmarks.html | tail -n1 | sed s/";".*$//`
	#echo "url:$url"
	#zdaunloudaj video iz youtuba
	echo "Downloading: $url"
	youtube-dl -q "$url"
	#ga pretvori v mp3			
	fileId=`echo $url | sed 's/^.*=//'`
	videoFilename=`ls *$fileId.*`
	audioFilename=`echo "$videoFilename" | sed 's/\..*$//g'`.wav
	echo "filename: $audioFilename"
	ffmpeg -i "$videoFilename" "$audioFilename" &> /dev/null
	#izbrisi video
	\rm "$videoFilename"
    #play audio
	mplayer "$audioFilename" &>/dev/null
}

#serches youtube for arguments and (hopefuly) returns first match
lynxYoutubeSkripta() {
	echo "key v"
	for i in {1..8}
	do
		echo "key Down Arrow"
	done
	echo "`echo "$*" | sed 's/\(.\)/\1\n/g' | sed 's/[ ]/<space>/g' | sed 's/^/key /g' | head -n -1`"
	echo "key Up Arrow"
	echo "key Right Arrow"
	for i in {1..44}
	do
		echo "key Down Arrow"
	done
	echo "key a
key l
key ^J
key q
key y"
}

#TODO da ne igra istih komadov
spilej3() {
	spilej "$@"
	spilej "$@"
	spilej "$@"
}

#Sets master volume from 0 to 100
vol() {
	amixer set Master playback "$1"
}

q() {
	vol "6dB+" | tail -n 1
}
a() {
	vol "6dB-" | tail -n 1
}
qq() {
	vol "2dB+" | tail -n 1
}
aa() {
	vol "2dB-" | tail -n 1
}

#      #
# TEXT #
#      #

alias tz='tail "$TODO"'
alias htu='gedit "$HUD" &'
alias ggg='gedit "$HUD" $HOME/.bash_aliases "$TODO" &'
alias nnn='n "$HUD" $HOME/.bash_aliases $HOME/.bashrc "$TODO"'
alias m1='m "$HUD"'
alias m2='m $HOME/.bash_aliases'
alias m3='m $HOME/.bashrc'
alias m4='m "$TODO"'

alias n1='n "$HUD"'
alias n2='n $HOME/.bash_aliases'
alias n3='n $HOME/.bashrc'
alias n4='n "$TODO"'

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
alias ztt='ztmp'
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


######## NEW / NOT SORTED #########

# Se pozene iz lessa ce pritisnemo v
export EDITOR="nano"

# Syntax highligh za less
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '

alias de='cd ~/Desktop; ls'
alias code='cd ~/code; ls'
alias data='cd ~/data; ls'

alias rss='nrss'

# Count lines in git repo
alias gitl='git ls-files | xargs wc -l'

vga() {
	#turn off laptop monitor if external is conected
	xrandr | grep VGA | grep " connected " > /dev/null
	if [ $? -eq 0 ]; then
    	xrandr --output LVDS1 --off
		killall nautilus
		nautilus -n &
	fi
}
