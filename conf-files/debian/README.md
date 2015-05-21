Debian - How to Install and Configure 
=====================================

If you're installing Debian on virtual machine
----------------------------------------------
1. Download and install '_VirtualBox_' form [here](https://www.virtualbox.org/wiki/Downloads)
2. Click on '_New_', set type to '_Linux_' and version to '_Debian_'. Choose enough ram (~800MB).
3. Select '_Create a virutal hard drive now_', '_VDI_', '_Dynamically allocated_'
4. Select big enough size (~1TB), because it will be very hard to enlarge later (even with GParted).
5. Click on '_Settings_'.
5. Set '_General_' > '_Advanced_' > '_Shared Clipboard_' to bidirectional, and deselect '_Mini ToolBar: Show in Fullscreen_'
6. Increase '_Display_' > '_Video_' > '_Video Memory_' (~40MB)
7. If you want Debian to be seen on the network by the host, then set '_Network_' > '_Adapter 1_' > '_Attached to:_' to '_Bridged Adapter_'
8. Add folders that you would like to share with Debian with '_Shared Folders_' > '_+_', and check '_Auto-mount_' for all.
9. Select '_View_' > '_Auto resize guest display_'
9. Start the created virtual machine by double clicking on it, and select the Debian iso file when prompted with '_Select start-up disk_'
10. Follow instructions for automatic installation from the first paragraph.


Automatic installation using preseed.cfg
----------------------------------------
The preseed.cfg file contains all the data needed for a fresh install of Debian Linux (version [jessie](http://cdimage.debian.org/debian-cd/8.0.0/i386/iso-cd/debian-8.0.0-i386-CD-1.iso)), so that it can be installed unattended. To use it pres ESC when the first menu (grub) shows up and specify its location, in this case:

`auto url=http://gto76.github.io/my-aliases/conf-files/debian/preseed.cfg`

!!! WARNING !!!
Installer will automatically partition the hard disk, and hence erase all data. Check the "_preseed.cfg_", line 149 for details.

#### Main features
- Will upgrade to testing suite (eternal updates)
- Will create user named "debian" with password "insecure" and set roots password to "r00tme"
- Beside the standard gnome desktop, the _Awesome_ windows manager will be installed
- Will automatically install and upgrade following packages: vim, sudo, mc, git, ssh, nrss, nmap, openjdk-7-jdk, vlc, htop, tree, gpm, fbi, tmux, awesome, lynx, curl, tcpdump, apt-file, gcc, make, konsole, pm-utils, strace, rfkill, mplayer2, youtube-dl, build-essential, module-assistant

#### If you want to modify the _preseed.cfg_...
1. Log in to www.github.com (or create acount)
2. Go to https://github.com/gto76/my-aliases and clisk '_fork_'
3. Descent to '_conf-files_' > '_debian_' > '_preseed.cfg_'
4. Edit the file by clicking on pencil button.
5. Click '_Commit changes_'
6. At the start of Debian instalation press _ESC_ and type:
	`auto url=http://<YOUR-GITHUB-USERNAME>.github.io/my-aliases/conf-files/debian/preseed.cfg`


After installation
------------------
1. Go to tty (ctrl + alt + F1)
2. Login as root:  
	`debian login: root`  
	`Password: r00tme`
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
	* win + ctrl + return - swap focused window with master (the biggest one)
	* win + w - close window
	* win + m - maximize/restore window (not that useful considering there exists a layout scheme that maximizes active window, just win + space to it)
	* ctrl + shift + q - quit Awesome (instantaneous / everything will be lost!)
	* win + <number> - jump to desktop
	* win + click on desktop number - move active window to selected desktop
	* win + h/l - resize the main window (works just in some ordering modes)
	* ctrl + win + r - reload Awesome configuration file (instantaneous / everything will stay as is, unless there is an syntax error in config file in which case everything will be lost -> run `awesome -k` to check if config file is OK. Config file is located at ~/my-aliases/dotfiles/awesome)

---
and also check out the [**BASH ALIASES**](https://github.com/gto76/my-aliases/tree/gh-pages/conf-files/bash)	

Enable shared folders if on VirtualBox
--------------------------------------
If you installed Linux on VirtualBox and want to access hosts
folders, have a shared clipboard, want to access usb devices and
have possibility of resizing window (basically you want this :)

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

Now your folders will be accessible at /media/<folder-name>

