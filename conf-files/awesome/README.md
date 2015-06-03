Awesome Window Manager
======================
Awesome is lightweight window manager for Linux. It does not have any *own* apps like a file explorer, terminal or options panel, so to use those you need a Gnome or some other proper desktop environment installed besides Awesome. It is however extremely lightweight, what comes very handy on older machines or virtual boxes.
But its main strength is that it eradicates the need for mouse for window management. But note that if you use it on laptop that media buttons wont work, and that there will be no wireless network finder or battery status widgets, so you will have to find those on the internets (of course if you run it inside virtual machine on the laptop, there is no need for these, because the host system provides them).

![screenshot](/doc/awesome-screenshot.png)

This folder contains *Awesome* configuration files `rc.lua`, `theme.lua`, a background wallpaper, and a `install` and `unistall` bash scripts, that make a link to the files from locations where these files ought to be.
The two configuration files don't change much besides providing a few additional keyboard shortcuts. Here is a list of them, combined with the default ones:  
 
* `win + return` - terminal
* `ctrl + alt + c` - Chrome
* `ctrl + alt + h` - Nautilus (home)
* `win + r` - Run command (tabs can be used to show suggestions)  
* `win + left mouse button` - move window  
* `win + right mouse button` - resize window  
* `win + space` - change window ordering scheme  
* `win + j/k` - jump to next/previous window (also alt + tab)  
* `win + shift + j/k` - change windows spot  
* `win + ctrl + return` - swap focused window with master (the biggest one)  
* `win + w` - close window  
* `win + m` - maximize/restore window (not that useful considering there exists a layout scheme that maximizes active window, just win + space to it)  
* `ctrl + shift + q` - quit Awesome (instantaneous / everything will be lost!)  
* `win + <number>` - jump to desktop  
* `win + click on desktop number` - move active window to selected desktop  
* `win + h/l` - resize the main window (works just in some ordering modes)  
* `ctrl + win + r` - reload Awesome configuration file (instantaneous / everything will stay as is, unless there is an syntax error in config file in which case everything will be lost -> run `awesome -k` to check if config file is OK. Config file is located at ~/my-aliases/dotfiles/awesome)  
	
