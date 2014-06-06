My Aliases
==========
My Linux config files, three handy text files, and an install script to put them all in a right place. 

## Quick overview:

```
.
├── Desktop
│   ├── ETC - List of thigs I first set up on a fresh install.
│   ├── NYK - Summaries of interesting computer topics.
│   └── WTF MAN - Long list of unix commands.
├── .nrss
│   └── config - Few rss feeds.
├── reaper
│   └── Reaper Shortcuts Jure 04.ReaperKeyMap - My Reaper DAW keymap.
├── .bash_aliases - My bash aliases and functions.
├── .bashrc - Few aliases that are locale specific.
├── install.sh - Installs links to files to coresponding directories.
├── README.md - You are here.
├── .vimrc - Few vim configurations.
├── .Xmodmapsi - Special keymap with capslock as additional modifier.
└── .Xmodmapus - Same, but for american layout.
```

The two biggest and most important files are:

* `.bash_aliases` and 
* `./Desktop/WTF MAN`. 
    
The first one contains handy bash scripts and aliases. You need .bashrc with this line: `. ~/.bash_aliases` in your home directory, for it to get loaded at console startup. 

Other big file `WTF MAN`, contains short explanations and examples of useful Unix commands. Once installed, they are easily accessible with the following commands: 
```
	m1 -> less WTF MAN, 
    m2 -> less .bash_alisases
	v1 -> vim WTF MAN, 
    v2 -> vim .bash_aliases
	n1 -> nano WTF MAN, 
    n2 -> nano .bash_aliases
```
Also note that if you change anything in .bash_aliases, you need to restart bash with `bash` command, or its `ba` alias.

## How to run:
```
	cd $HOME
	git clone https://github.com/gto76/my-aliases.git
	cd my-aliases
    ./install.sh
```
For details about install script see next section.

## Files in detail:

### install.sh:
Executable bash script that creates hard links to all files of the project and places them in home directory. All files that are not at root of a project get their links created in corresponding directories of home directory. If directories don't yet exist, they get created. If file with same name already exists, it is not overwritten, only a warning gets printed. 
To execute it run:
```
    ./install.sh
```
Of course you can also create links yourself, or even just copy the files if you don't intend to commit.

### .bashrc:
My own .bashrc. Kind of ties everything together. Useles without .bash_aliases, WTF MAN and .Xmodmapus. In detail:
* Exports path of WTF MAN. It is set to `$HOME/my-aliases/Desktop/WTF MAN`.
* Defines aliases **us** and **si**, that set up my custom keymaps. (see .Xmodmapus, .Xmodmapsi)
* Defines aliases that enable easy access to .bash_aliases (2), WTF MAN (1), TODO (4) and to itself (3). They are composed out of a letter and a number. Letter signifies a program (m - less, v - vim, n - nano, g - gedit) and number a file.

###.bash_aliases:
My own .bash_aliases. Besides a lot of useful aliases, there are also some interesting functions, such as:

* **teaceroute1** - Prints country codes of hosts on path.

* **www** - Traceroutes one server per country, prints country codes of hosts on path. 

* **spilej** - Plays an artist/song/album. First looks in pwd, then runs locate to search whole file system. At the end it tries to find it on YouTube and download the video and convert it to audio and play it. Most of the problems occur at search phase.

* **catOrLess** - Runs either cat or less, depending on size of output. Works with files or input stream.

* **weathr** - Weather report. Needs city ID -> Go to yahoo weather, search your location, and copy its id from address bar.

* **noh** - How many people are on network beside you (number of hosts).

* **ip1** - What's my internal ip.

* **ip2** - What's my external ip.

* **pingAll** - Pings gateway, 8.23.224.10 and Google.

* **gi** - Downloads small image of a phrase from google images.

* **wi** - Tries to find description of a command using "whatis", "apt-cache show" and "type". Returns first match.

### .Desktop/WTF MAN:
Long list of unix commands with short descriptions. Useful for quick search before you start googling. In .bashrc there are few aliases defined that enable quick access, namely:
```
	m1 -> less .Desktop/WTF MAN
	c1 -> grep .Desktop/WTF MAN
	v1 -> vim .Desktop/WTF MAN
	n1 -> nano .Desktop/WTF MAN
```

### .Xmodmapus, .Xmodmapsi:
Keymaps that make CapsLock an additional modifier key. With it pressed, the keys under your right arm become numpad keys (the ones with NumLock off, e.g. Home, End, PgUp...), but with few additions like: 'k' key that corresponds to '5' on a numpad becomes down key, 'p' becomes backspace, ';' enter, '/' delete, and "'" escape. Also space becomes enter, backspace delete, '`' escape, and all the number keys their corresponding F keys. Here is the american version - .Xmodmapus:

![Alt text](/doc/Xmodmapus.png?raw=true "Picture of Keyboard")
Also present is slovenian version - .Xmodmapsi.

Warning: For keymaps to work, it is mandatory that layout for that language is set before xmodmap is run. For example if American layout is selected and we want Slovenian we need to type:
```
	setxkbmap -layout si
	xmodmap ~/.Xmodmapsi
```
In .bashrc there are already two aliases that do this, namely `us` for American and `si` for Slovenian layout. If you want keymaps to get loaded when X starts (at least for Mint/Debian), go to Startup Applications and add new aplication: "xmodmap $HOME/.Xmodmapus" with 2 second delay.

### .reaper/Reaper Shortcuts Jure 04.ReaperKeyMap:
Custom shortcuts for Reaper DAW (digital audio workstation).

![Alt text](/doc/reaper-keyboard-shortcuts.png?raw=true "Picture of Keyboard")
Mind that there are a lot of other shortcuts not on picture, that use modifiers.

