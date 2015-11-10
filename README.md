My Linux Setup
==============
My Linux configuration files, three handy text files, and an install script to put them all in a right place.

How to install
--------------

```bash
cd
git clone https://github.com/gto76/my-linux-setup.git
cd my-linux-setup 
./install-linux
bash
```

Configuration Files
------------
They are grouped by the target operating system.

#### Linux
This folder contains files that work with standard Linux distributions. They configure following programs:
* [**Awesome**](/conf-files/linux/awesome) - a window manager. 
*  [**Bash**](/conf-files/linux/bash) - main Linux shell (program that interprets what you type in terminal). 
* Nrss - RSS feed reader
* Tmux - terminal multiplexer (program that lets you use multiple terminals inside one, useful when connecting to other computer using *ssh*)
* Vim - The text editor
* [**Xmodmap**](/conf-files/linux/xmodmap) - program that modifies keyboard mappings. For details click

#### BusyBox
Configuration files intended for systems providing only a slimmed down collection of Linux commands, called BusyBox.

#### Windows
These files are used by shell programs that are made to simulate a Linux environment on windows, like *Git Shell*. Only file that actually effects windows is *AutoHotkey.ahk*; a config file for *AutoHotkey* program that enables you to set system wide keyboard shortcuts.  

#### Debian
These files are intended to automatize the Debian Linux installation.   
For details see [**README**](conf-files/debian).

Text Files
----------
Textfiles with notes about various Linux commands, configurations, tools, etc.  
For details see [**README**](text-files).

Install script
--------------
Executable bash script that creates symbolic links to all dot and text files of the project and places them in home and Desktop directory. If file with same name already exists, it is not overwritten, only a warning gets printed. At the end following lines are added to the `.bashrc` file in your home directory:
``` bash
if [ -f ~/.my_bashrc ]; then
   . ~/.my_bashrc
fi
```
This way aliases and functions in [**`.my_bashrc`**](/conf-files/linux/bash/.my_bashrc) get loaded at terminal startup. [**`.my_bashrc`**](/conf-files/linux/bash/.my_bashrc) then loads other two files ([**`.my_bash_aliases`**](/conf-files/linux/bash/.my_bash_aliases) and [**`.my_bashrc_personal`**](/conf-files/linux/bash/.my_bashrc_personal)) in a same manner.
Also following line: `so ~/.my_vimrc` is added to the end of a `.vimrc` file, which loads [**`.my_vimrc`**](/conf-files/linux/bash/.my_vimrc) at Vim startup. 

Of course you can instead create links yourself, or even just copy the files if you don't intend to commit changes.






