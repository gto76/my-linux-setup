Debian automatic installation
=============================

The preseed.cfg file contains all the data needed for a fresh install of debian linux (version jessie), so that it can be installed unatended. To use it pres ESC when the first menu (grub) shows up and specify its location, in this case:

`auto url=http://gto76.github.io/my-aliases/debian/preseed.cfg`

!!! WARNING !!!
Installer will automaticaly partition the hard disk, and hence erase all data. Check the `reseed.cfg`, line 149 for details.

Main features
-------------
- Will install testing suite (eternal updates)
- Will create user named "debian" with password "insecure" and set roots password to "r00tme"
- Beside the standard gnome desktop, the awesome windows manager will be installed
- Will automatically install and upgrade folowing packages: vim, sudo, mc, git, ssh, nrss, nmap, openjdk-7-jdk, vlc, htop, tree, gpm, fbi, tmux, awesome, lynx, curl, tcpdump, apt-file, gcc, make, konsole, pm-utils, strace, rfkill, mplayer2, youtube-dl

After instalation
-----------------
1. Go to tty (ctrl + alt + F1)
2. Login as root (password: r00tme)
3. Change roots password:  
	`$ passwd <new-password>`
4. Delete existing user:  
	`$ deluser -remove-all-files debian`
5. Add yourself:  
	`$ adduser <your-login-name>`
6. Add yourself to sudo group  
	`$ adduser <your-login-name> sudo`
7. Log out  
	`$ exit`
8. Go to login screen (alt + ctrl + F7), and login to gnome as yourself
9. Open terminal window (press win button and type terminal)
10. Download `install` script and `install.cfg` conf file.  
	`$ wget http://gto76.github.io/my-aliases/debian/install`
	`$ wget http://gto76.github.io/my-aliases/debian/install.cfg`
11. Change install.cfg according to your needs  
	`$ nano install.cfg`
12. Run install  
	`$ bash install`
13. Clone my-aliases git project  
	`$ git clone git@github:/gto76/my-aliases.git`
14. Install them  
	`$ cd my-aliases`
	`$ ./install`
15. Install Awesome config files  
	`$ cd dotfiles/awesome`
	`$ ./install`

Set up remaining things with mouse
----------------------------------

1. Edit gnome-terminals apperance:
 * Open terminal (win + return)
 * Change background color to black (preferences...)
 * Change colors to ? (preferences...)
 * Disable menu (preferences ...)

2. Download chrome:
 * Open snowwheesel? (press: win + r, then type snowwhessel)
 * Go to chrome download site, download and install
 * Download extensions (vimium, addblock plus, hola)
 * Sign in to chrome to get bookmarks



	


	
