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
- Will automatically install and upgrade folowing packages: 

After instalation
-----------------
1. Go to tty (ctrl + alt + F1)
2. Login as root:
	username: root
	password: r00tme
3. Change password:
	$ passwd <new-password>
4. Download install script and install.cfg conf file.
	$ wget http://gto76.github.io/my-aliases/debian/install
	$ wget http://gto76.github.io/my-aliases/debian/install.cfg
5. Edit install.cfg for your needs
	$ nano install.cfg
6. Run install
	$ ./install
8. Switch to newly created user
	su - <new-user>
9. Clone my-aliases git project
	$ git clone git@github:/gto76/my-aliases.git
10. Install them 
	$ cd my-aliases
	$ ./install
11. Install Awesome config files
	$ cd dotfiles/awesome
	$ ./install
12. Rerun bash so aliases take effect
	$ bash

Set up remaining things with mouse
----------------------------------
1. Go to login screen (alt + ctrl + F7)
2. Open desktop selection menu (by login button) and select awesome
3. Login as you

4. Edit gnome-terminals apperance:
 * Open terminal (win + return)
 * Change background color to black (preferences...)
 * Change colors to ? (preferences...)
 * Disable menu (preferences ...)

5. Download chrome:
 * Open snowwheesel? (press: win + r, then type snowwhessel)
 * Go to chrome download site, download and install
 * Download extensions (vimium, addblock plus, hola)
 * Sign in to chrome to get bookmarks

6.



	


	
