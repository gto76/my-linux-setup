Debian automatic installation
-----------------------------

The preseed.cfg file contains all the data needed for a fresh install of debian linux (version jessie), so that it can be installed unatended. To use it pres ESC when the first menu (grub) shows up and specify its location, in this case:

`auto url=http://gto76.github.io/my-aliases/debian/preseed.cfg`

!!! WARNING !!!
Installer will automaticaly partition the hard disk, and hence erase all data. Check the `reseed.cfg`, line 149 for details.

#### Main features
- Will install testing suite (eternal updates)
- Will create user named "debian" with password "insecure" and set roots password to "r00tme"
- Beside the standard gnome desktop, the awesome windows manager will be installed
- Will automatically install and upgrade folowing packages: 
	
