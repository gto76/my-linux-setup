Bash
====

ctrl c - cancel job / erase input line
ctrl+shift c - copy
ctrl+shift v - pastek

Cool aliases
------------
Output of most commands is send to pager if it cant fit on one page.
Values in square brackets are optional, three dots mean there can be more than one.


#### General

* c - cat
* e - echo


* emacsmode - Switch to normal terminal input mode (my default
is vi mode)
* l, ll, lll - ls and ls -l with some additional options
* t - tree with some additional options
* rmdir, cpdir, mvdir - remove, copy or move directory
* .., ..., .... - cd .., cd ../.., cd ../../..
* m -  It runs cat or less, depending on wether the input or file
can fit on one screen (output of most aliases here get send to
this commad at the end)
* n -> nano - Nano text editor with some additional options
* v -> vim text editor
* vv -> vim read only
* vvv -> vim in separate console, with smaller font and white background
back
* rb -> runInBackground - Runs a secified command in background
* h -> history - Displays past commands, or only ones that contain pattern, if specified
* df1 -> disk free - Prints disks fullnes in human readable
format
* o -> xdg-open - Open file with default aplication for the file type

* du1 -> du - Shows disk usage of everything in and under current
folder or specified folder if passed.
* na -> nautilus - File explorer
* te -> terminal - Starts new terminal
* f -> fuck - Runs last command with sudo
* v2 -> vim ~/.my_bash_aliases - Opens file that contains this
aliases for editing
* n2 -> nano ~/.my_bash_aliases - Same but with Nano
* backup - Backups file by making its copy with .bkp extension
* find1 -> find - Searches for file in subdirectories and
highlights the matches
* gr PATTERN [FILE...] -> grep - Searches trough specified files for the pattern, using perl regural expressions, and highlights the matches.
* me FILE - make executable -> Creates empty bash executable
file, or just makes it executable if already exists.

##### Sudo
* sn - sudo nano
* srm, scp, smv -> sudo rm/cp/mv
* srmdir, scpdir, smvdir -> sudo rmdir/cpdir/mvdir

#### Packages
* ch PACKAGE -> canhaz -> apt-get install - Installs desired package
* update - Gets info about new and updated packages
* upgrade - Installs newest versions of all packages currently
installed
* dist-upgrade - Upgrades system and intelegently handles
changed dependencies (may remove some packages)
* purge PACKAGE - Remove package together with it's configuration files
* version PACKAGE - Prints installed and available version of the package
* packages - Prints all packages installed by user ordered by instalation date
* wi COMMAND/PACKAGE/ALIAS/KEYWORD -> what is - The ultimate search command for commands/packages. Consists of consecutive calls to different search commands like whatis, apt-cache show, type, which, apt-file search and apt-cache search. It starts by searching among the installed packages, and if doesn't find anything goes on to search online.
* search PATTERN - Searches all packages for keyword

#### Processes
* ps1 - ps -e - Prints all processes
* pgrep1 PATTERN - Greps all processes for pattern
* kill1 PID - Sends kill signal to the process

#### System
hib - Hibernate
sus - Suspend
restart - Restart
poweroff - Shut down


#### Git
* commit [MESSAGE] - Commits with --all option and  will generate generic commit message if not provided
* push -> git push
* pull -> git pull
* gs -> git status - Shows status in short format
* gl -> git log - Nicely  decorated log with graph on the side
* gd -> git diff
* ga FILE... -> git add

#### Network
* ip1 - Prints your local ip
* ip2 - Prints your global ip
* gateway - Prints gateways ip
* pa -> Ping All - Pings gateway, a webserver with ip, and 'www.google.com'
* ne -> Network - Prints ips of network hosts and status of their ssh ports. Also checks if connection to internet works.

* up - turns wireless adapter on
* down - turns wireless adapter off
:



