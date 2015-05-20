Debian automatic installation
=============================

The preseed.cfg file contains all the data needed for a fresh install of Debian Linux (version jessie), so that it can be installed unattended. To use it pres ESC when the first menu (grub) shows up and specify its location, in this case:

`auto url=http://gto76.github.io/my-aliases/debian/preseed.cfg`

!!! WARNING !!!
Installer will automatically partition the hard disk, and hence erase all data. Check the "_preseed.cfg_", line 149 for details.


Main features
-------------
- Will install testing suite (eternal updates)
- Will create user named "debian" with password "insecure" and set roots password to "r00tme"
- Beside the standard gnome desktop, the awesome windows manager will be installed
- Will automatically install and upgrade following packages: vim, sudo, mc, git, ssh, nrss, nmap, openjdk-7-jdk, vlc, htop, tree, gpm, fbi, tmux, awesome, lynx, curl, tcpdump, apt-file, gcc, make, konsole, pm-utils, strace, rfkill, mplayer2, youtube-dl, build-essential, module-assistant


After installation
-----------------
1. Go to tty (ctrl + alt + F1)
2. Login as root (password: r00tme)
3. Change roots password:  
	`$ passwd`
4. Delete existing user:  
	`$ deluser -remove-all-files debian`
5. Add yourself:  
	`$ adduser <your-login-name>`
6. Add yourself to sudo group  
	`$ adduser <your-login-name> sudo`
7. Log out  
	`$ exit`
8. Go to login screen (alt + ctrl + F7), click on 'not listed' and login to gnome as yourself
9. Open terminal window (press win key and type terminal)
10. Download "_install_" script and "_install.cfg_" conf file.  
	`$ wget http://gto76.github.io/my-aliases/debian/install`  
	`$ wget http://gto76.github.io/my-aliases/debian/install.cfg`
11. Change "_install.cfg_" according to your needs  
	`$ nano install.cfg`
12. Run install  
	`$ bash install`
13. If you chose to generate ssh key for git open web browser, then copy it from the terminal, and add it to Github
	`$ iceweasel github.com`
	Sign in and go to 'acount settings' > 'ssh keys' > 'add ssh key'
	Close the browser
13. Clone my-aliases git project  
	`$ git clone git@github.com:/gto76/my-aliases.git`
14. Install them  
	`$ cd my-aliases`  
	`$ ./install`
15. Install Awesome config files  
	`$ cd dotfiles/awesome`  
	`$ ./install`


Set up remaining things with mouse
----------------------------------

1. Edit gnome-terminals appearance:
 * Change colors (Edit > Preferences > Profiles > Edit > Colors)
 	- Uncheck '_Use colors from system theme_'
 	- Select '_White on Black_' scheme for text and background
 	- Select '_Tango_' scheme for palette
 * Disable menubar (Edit > Preferences > General)
 	- Uncheck '_Show menubar by default in new terminals_'

2. Download Chrome:  
	- `$ iceweasel google.com/chrome`
	- Select the right version and download (select save file)
	- Open containing folder, right click, open with > Package Install
 	- Sign in to chrome to get the bookmarks and extensions (do not rename the bookmarks folders, or they will duplicate on all machines)

 
Check out Awesome
-----------------
1. Restart (System menu, power button icon, restart)

2. Log in to Awesome (select your username and click the options button by the 'Sign In' and select Awesome from the list)
	* win + return - terminal
	* ctrl + alt + c - Chrome
	* ctrl + alt + h - Nautilus (home)
	* win + r - Run command (tabs can be used to show suggestions)
	* win + left mouse button - move window
	* win + right mouse button - resize window
	* win + space - change window ordering scheme
	* win + j/k - jump to next/previous window (also alt + tab)
	* win + shift + j/k - change windows spot
	* win + w - close window
	* win + m - maximize/restore window (not that useful considering there exista a layout sheme that maximizes active window, just win + space to it)
	* ctrl + shift + q - quit Awesome (instantaneous / everything will be lost!)
	* win + <number> - jump to desktop
	* win + click on desktop number - move active window to selected desktop
	* win + h/l - resize the main window (works just in some ordering modes)
	* ctrl + win + r - reload Awesome configuration file (instantaneous / everything will stay as is, unless there is an syntax error in config file in which case everything will be lost -> run `awesome -k` to check if config file is OK. Config file is located at ~/my-aliases/dotfiles/awesome)
	

Enable shared folders if on VirtualBox
--------------------------------------
If you installed Linux on VirtualBox and want to access hosts
folders, have a shared clipboard, want to access usb devices and
have posibility of resizing window (basically you want this :)

3. Click on 'Devices' > 'Insert Guest Additions CD image...", then run 

1. Install required packages with 
	`$ sudo apt-get install build-essential module-assistant`
2. Configure your system for building kernel modules by running 
	`$ sudo m-a prepare`
	`$ sudo mount /media/cdrom`
4. Install the additions 
	`$ sudo bash /media/cdrom/VBoxLinuxAdditions.run`
5. Add yourself to vboxsf group
	`$ sudo adduser <user> vboxsf
7. Log out and log in

6. Add the folders you want to share with the clien at 'Devices' > 'Shared Folder Settings'
8. Also shared clipboard can be enabled at 'Devices' > 'Shared
   Clipboard', and USB devices can be provided at 'Devices' >
   'USB Debvices'

Now your folders will be accesible at /media/<folder-name>
