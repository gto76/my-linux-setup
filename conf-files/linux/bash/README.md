Bash
====

ctrl c - cancel job / erase input line  
ctrl+shift c - copy  
ctrl+shift v - paste 

Output of most commands is send to pager if it won't fit on one page.  
Values in square brackets are optional. Three dots after the value mean there can be more than one value. Three dots after the command mean it is called with additional options (run `ty COMMAND` to see exactly which)

General
-------
>`c [FILE]` ⇾ `cat` - Prints contents of a file to terminal  
>`e [TEXT]` ⇾ `echo` - Prints text to terminal

>`emacsmode` - Switch to normal terminal input mode (my default is vi mode)  
>`l, ll, lll` ⇾ `ls` with a lot of additional options  
>`t` ⇾  `tree` - Displays file hierarchy in a tree view  
>`rmdir, cpdir, mvdir` - Delete, copy or move directory  
>`.., ..., ....` ⇾  `cd .., cd ../.., cd ../../..`   
>`m [FILE]` or `cat [FILE] | m` -  It runs *cat* (just prints the file) or *less* (opens file in a pager), depending on whether the input or file can fit on one screen (output of most commands described here get send to this command at the end)  
>`n [FILE]` ⇾ `nano` text editor with some additional options  
>`v [FILE]` ⇾ `vim` text editor  
>`vv [FILE]` ⇾ `vim` in read only mode   
>`vvv [FILE]` ⇾ `vim` in separate console, with smaller font and white background  
>`rb COMMAND` ⇾ `runInBackground` - Runs a specified command in background  
>`h [PATTERN]` ⇾ `history` - Displays past commands, or only ones that contain pattern, if specified  
>`df1` ⇾ `disk fullnes` - Prints disks space usage in human readable format  
>`o FILE` ⇾ `xdg-open` - Open file with default application for the file type  

>`du1 [FILE...]` ⇾ `du ...` - Shows file space usage of all files in and under current folder or specified folder if passed.  
>`na` ⇾ `nautilus` - Opens File explorer in background  
>`te` ⇾ `terminal`  - Starts new terminal in background  
>`f` ⇾ `fuck` - Runs last command with sudo  
>`v2` ⇾ `vim ~/.my_bash_aliases` - Opens file that contains this aliases in *vim* text editor
>`n2` ⇾ `nano ~/.my_bash_aliases` - Same but with *nano*
>`backup FILE` - Backups file by making its copy with *.bkp* extension  
>`find1 [PATTERN]` ⇾ `find ...` - Searches for file in subdirectories and highlights the matches  
>`gr PATTERN [FILE...]` ⇾ `grep ...` - Searches trough specified files for the pattern, using perl regular expressions, and highlights the matches.  
>`me FILE` ⇾ `createExecutable` - Creates empty bash executable file, or just makes it executable if already exists.  
>`ty COMMAND` ⇾ `type` - Check what the command is aliased to  

Sudo
----
>`sn FILE` ⇾ `sudo nano ...` - opens file in *nano* text editor with superuser privileges  
>`sv FILE` ⇾ `sudo vim` - opens file in *vim* with superuser privileges  
>`srm/scp/smv FILE` ⇾ `sudo rm/cp/mv` - deletes/copies/moves file with superuser privileges  
>`srmdir/scpdir/smvdir DIR` ⇾ `sudo rmdir/cpdir/mvdir` - deletes/copies/moves a directory with superuser privileges  

Packages
--------
>`ch PACKAGE` ⇾ `canhaz` ⇾ `sudo apt-get install`- Installs desired package  
>`update` - Gets info about new and updated packages  
>`upgrade` - Installs newest versions of all packages currently installed  
>`dist-upgrade` - Upgrades system and intelligently handles changed dependencies (may remove some packages)  
>`purge PACKAGE` - Remove package together with it's configuration files  
>`version PACKAGE` - Prints installed and available version of the package  
>`packages` - Prints all packages installed by user ordered by installation date  
>`wi PATTERN` ⇾ `whatIs` - The ultimate search command for commands/packages/aliases/keywords. Consists of consecutive calls to different search commands like *whatis*, *apt-cache show*, *type, which*, *apt-file search* and *apt-cache search*. It starts by searching among the installed packages, and if it doesn't find anything, goes on to search online.  
>`search PATTERN` - Searches all packages for keyword  

Processes
---------
>`ps1` - Prints all processes  
>`pgrep1 PATTERN` - Greps all processes for pattern  
>`kill1 PID` - Sends kill signal to the process  

System
-----
>`hib` - Hibernate  
>`sus` - Suspend  
>`restart` - Restart  
>`poweroff` - Shut down  

Git
---
>`commit [MESSAGE]` ⇾ `git commit -am MESSAGE` - Commits with --all option and  will generate generic commit message if not provided  
>`push` ⇾ `git push`  
>`pull` ⇾ `git pull`  
>`gs` ⇾ `git status ...` - Shows status in short format  
>`gl` ⇾ `git log ...` - Nicely decorated log with graph on the side  
>`gd` ⇾ `git diff`  
>`ga FILE...` ⇾ `git add`  
>`gu` ⇾ `git remote update`- Pulls info about the state of the remote repository

Network
-------
>`ip1` - Prints your local ip  
>`ip2` - Prints your global ip  
>`gateway` - Prints gateways ip  
>`pa` ⇾ `pingAll` - Pings gateway, a webserver with ip, and '_www.google.com_'  
>`ne` ⇾ `network` - Prints ips of network hosts and status of their ssh ports. Also checks if connection to internet works.  

>`up` - turns wireless adapter on  
>`down` - turns wireless adapter off  

Misc
----
>`teaceroute1 IP/DOMAIN` - Prints country codes of hosts on path.  
>`www` - Traceroutes one server per country, prints country codes of hosts on path.   
>`spilej PATTERN` - Plays an artist/song/album. First looks in current directory, then runs locate to search whole file system. At the end it tries to find it on YouTube and download the video and convert it to audio and play it. Most of the problems with downloading from youtube occur at search phase.  
>`gi PATTERN` - Downloads small image of a phrase from Google images.  





