My Aliases
==========
My Linux config files, three handy text files, and an install script to put them all in a right place.

Text Files
----------
Texfiles with notes about various linux commands,
configurations, tools, etc.
For details see [**text-files**](text-files)

Configuration Files
------------
They are grouped by the target operating system.
Main group is inteded for standard linux distributions: [**conf-files/linux**](conf-files/linux)

#### Linux
conf-files/linux/awesome
conf-files/linux/bash
conf-files/linux/xmodmap

#### Busybox
Configuration files intended for systems providing only a slimmed down collection of linux commands, called Busybox.

#### Windows
These files are used by shell programms that are made to simulate a linux environment on windows, like *Git Shell*. Only file that actualy effects windows is *AutoHotkey.ahk*; a config file for *AutoHotkey* program that enabels you to set system wide keyboard shortcuts.  

#### Debian
These files are intendet to avtomatize the Debian Linux installation. 
For details see [**README**](conf-files/debian)



Quick overview
--------------

```
.
├── dotfiles
│   ├── .nrss
│   │   └── config - Few rss feeds.
│   ├── .my_bash_aliases - My aliases and functions. Can be used alone.
│   ├── .my_bashrc - Aliases that only work with other files in a project.
│   ├── .my_bashrc_personal - Few aliases that are locale specific.
│   ├── .my_vimrc - My vim configuration.
│   ├── .Xmodmapus - Keymap. 'jikl' become arrow keys when capslock is pressed.
│   └── .Xmodmapusvi - Same, but with 'hjkl' for arrows.
│   ├── .Xmodmapsi - Slovenian version of .Xmodmapus.
│   ├── .Xmodmapsivi - Same, but with 'hjkl' for arrows.
├── keymaps
│   └── Reaper Shortcuts Jure 04.ReaperKeyMap - My Reaper DAW keymap.
├── textfiles
│   ├── INS - List of things I first set up on a fresh install.
│   ├── NYK - Summaries of interesting computer topics.
│   └── WTF-MAN - Long list of Unix commands.
├── install - Links dotfiles to HOME and textfiles to Desktop.
└── README.md - You are here.
```

Two biggest and most important files are:

* [**`./dotfiles/.my_bash_aliases`**](dotfiles/.my_bash_aliases) and 
* [**`./textfiles/WTF-MAN`**](textfiles/WTF-MAN). 
    

The first one contains handy bash functions and aliases. It can be used without other files in a project; just copy it in home directory and add this line: `. ~/.my_bash_aliases` to `.bashrc` (which is also located in home directory, if not create it). If you want to use the whole project then instead use install script (see below).

Other big file [**`WTF-MAN`**](textfiles/WTF-MAN), contains short explanations and examples of useful Unix commands. 

Once everything is installed, they are easily accessible with the following commands: 
* **`m1`** - `'less WTF-MAN'`
* **`m2`** - `'less .bash_alisases'`
* **`v1`** - `'vim WTF-MAN'`
* **`v2`** - `'vim .bash_aliases'`
* **`n1`** - `'nano WTF-MAN'`
* **`n2`** - `'nano .bash_aliases'`

Also note that if you change anything in [**`.my_bash_aliases`**](dotfiles/.my_bash_aliases), you need to restart bash with `bash` command, or its `ba` alias.

How to install
--------------

```bash
cd
git clone https://github.com/gto76/my-aliases.git
cd my-aliases
./install
bash
```

Files in detail
---------------

### [`install`](install)
Executable bash script that creates symbolic links to all dot and text files of the project and places them in home and Desktop directory. If file with same name already exists, it is not overwritten, only a warning gets printed. At the end following lines are added to the `.bashrc` file in your home directory:
``` bash
if [ -f ~/.my_bashrc ]; then
   . ~/.my_bashrc
fi
```
This way aliases and functions in [**`.my_bashrc`**](dotfiles/.my_bashrc) get loaded at terminal startup. [**`.my_bashrc`**](dotfiles/.my_bashrc) then loads other two files ([**`.my_bash_aliases`**](dotfiles/.my_bash_aliases) and [**`.my_bashrc_personal`**](dotfiles/.my_bashrc_personal)) in a same manner.
Also following line: `so ~/.my_vimrc` is added to the end of a `.vimrc` file, which loads [**`.my_vimrc`**](dotfiles/.my_vimrc) at Vim startup. 

To execute it run:
```
    ./install
```
Of course you can also create links yourself, or even just copy the files if you don't intend to commit changes.






