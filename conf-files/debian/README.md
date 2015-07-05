Debian Linux - How to Install and Configure 
=====================================

Download ISO image from [**HERE**](http://cdimage.debian.org/debian-cd/8.0.0/i386/iso-cd/debian-8.0.0-i386-CD-1.iso)

If you're installing Debian on VirtualBox
-----------------------------------------
1. Download and install [**VirtualBox**](http://download.virtualbox.org/virtualbox/4.3.28/VirtualBox-4.3.28-100309-Win.exe)  
2. Click on '_New_', set type to '_Linux_' and version to '_Debian_'. Choose enough ram (~800MB).
3. Select '_Create a virutal hard drive now_' > '_VDI_' > '_Dynamically allocated_'
4. Select big enough size (~1TB), because it will be very hard to enlarge later (even with *GParted*), and since it is dynamically allocated, it will only take as much space as it needs to store the files, that is around 7GB when freshly installed. If this is too much, you can deselect few packages by changing *preseed.cfg* file (see next section)  
5. Click on '_Settings_'.
5. Set '_General_' > '_Advanced_' > '_Shared Clipboard_' to bidirectional, and deselect '_Mini ToolBar: Show in Fullscreen_'
6. Increase '_Display_' > '_Video_' > '_Video Memory_' (~40MB)
7. If you want Debian to be seen on the network by the host, then set '_Network_' > '_Adapter 1_' > '_Attached to:_' to '_Bridged Adapter_'
8. Add folders that you would like to share with Debian with '_Shared Folders_' > '_+_', and check '_Auto-mount_' for all.
9. Start the created virtual machine by double clicking on it. When prompted with '_Select start-up disk_', click the folder button and select the Debian ISO file. 
9. Select '_View_' > '_Auto resize guest display_'
10. (optional) Change guest clock synchronization to 1 second (in Command Prompt):   
```
	$ cd "c:\Program Files\Oracle\VirtualBox"
	$ VBoxManage.exe guestproperty set <vm-name> "/VirtualBox/GuestAdd/VBoxService/--timesync-set-treshold" 1000
```

Automatic installation using preseed.cfg
----------------------------------------
The *preseed.cfg* file contains all the answers to the questions that you would get asked during installation of *Debian Linux* (version *Jessie*). To use it pres '*Esc*' when the '*installer boot menu*' shows up and enter this line:

`auto url=http://gto76.github.io/my-linux-setup/conf-files/debian/preseed.cfg`

**!!! WARNING !!!**  
If you use this *preseed.cfg* file, installer will automatically partition the hard disk, and hence erase all data. (this is OK if you're installing on VirtualBox because you're using '*virutal hard drive*', which is just an ordinary file in your filesystem, so this will have no effect on your actual hard drive). Check the "_preseed.cfg_", line 149 for details. 

#### Main features
- Will upgrade to testing suite (eternal updates)
- Will create user named "debian" with password "insecure" and set roots password to "r00tme"
- Beside the standard *GNOME* desktop, the _Awesome_ windows manager will be installed
- Will automatically install and upgrade following packages: vim, sudo, mc, git, ssh, nrss, nmap, openjdk-7-jdk, vlc, htop, tree, gpm, fbi, tmux, awesome, lynx, curl, tcpdump, apt-file, gcc, make, konsole, pm-utils, strace, rfkill, mplayer2, youtube-dl, build-essential, module-assistant

#### If you want to modify the _preseed.cfg_...
1. Log in to www.github.com (or create acount)
2. Go to https://github.com/gto76/my-linux-setup and click '_fork_'
3. Descent to '_conf-files_' > '_debian_' > '_preseed.cfg_'
4. Edit the file by clicking on pencil button.
5. Click '_Commit changes_'
6. At the start of Debian instalation press '*Esc*' and type:
	`auto url=http://<YOUR-GITHUB-USERNAME>.github.io/my-linux-setup/conf-files/debian/preseed.cfg`


After installation
------------------
1. Go to tty (ctrl+alt F1)
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
8. Go to login screen (alt+ctrl F7), click on _'not listed'_ and login to _GNOME_ as yourself
9. Open terminal window (press win key and type terminal)
10. Download "_install_" script and "_install.cfg_" conf file.  
	`$ wget http://gto76.github.io/my-linux-setup/conf-files/debian/install`  
	`$ wget http://gto76.github.io/my-linux-setup/conf-files/debian/install.cfg`
11. Modify "_install.cfg_" according to your needs (ctrl+o = save, ctrl+x = exit)  
	`$ nano install.cfg`
12. Run install  
	`$ bash install`
13. If you chose to generate ssh key for git:  
	- Copy it from the terminal (ctrl+alt c)  
	- Go to GitHub: `$ iceweasel github.com`  
	- Sign in and go to 'account settings' > 'ssh keys' > 'add ssh key'  
13. Clone my-linux-setup git project (change 'gto76' with your Git username, if you already forked the project)
	- If you have ssh key, use: `$ git clone git@github.com:/gto76/my-linux-setup.git`  
	- If you don't have it, use: `$ git clone https://github.com/gto76/my-linux-setup`
14. Install it  
	`$ cd my-linux-setup`  
	`$ ./install-linux`
15. Install Awesome config files  
	`$ cd conf-files/linux/awesome`  
	`$ ./install`
16. If you're installing Linux on VirtualBox, you can make links to shared folders inside your home folder with:  
	`$ cd`  
	`$ sudo ln -s /media/sf_* .`  


Set up remaining things with mouse
----------------------------------

1. Edit *GNOME Terminal*'s appearance:
 * Change colors (Edit > Preferences > Profiles > Edit > Colors)
 	- Uncheck '_Use colors from system theme_'
 	- Select '_White on Black_' scheme for text and background
 	- Select '_Tango_' scheme for palette
 * Disable menubar (Edit > Preferences > General)
 	- Uncheck '_Show menubar by default in new terminals_'

2. Download *Chrome*:  
	- `$ iceweasel google.com/chrome`
	- Select the right version and download (select save file)
	- Open containing folder, right click, open with > Package Install
 	- Sign in to chrome to get the bookmarks and extensions (do not rename the bookmarks folders, or they will duplicate on all machines)

 
Check out [Awesome Window Manager](/conf-files/linux/awesome)
-----------------
1. Restart computer (System menu > power button icon > restart)
2. Log in to *Awesome* (select your username and click the options button by the 'Sign In' and select Awesome from the list)


Check out [**Terminal Commands**](/conf-files/linux/bash)	
-----------------
By installing *my-linux-setup* project you get a ton of additional terminal commands, most of which are a standard command with abbreviated name or number '*1*' added to the name. This commands most often call the standard command with some sensible set of options and send output to the pager if it doesn't fit the screen.

