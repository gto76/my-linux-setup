My Aliases
==========
==========
Basicly my linux config files, three handy text files and an install script to put them all in a right place. 

quick overview:
---

```
.
├── Desktop
│   ├── ETC - List of thigs I first set up on a fresh install
│   ├── NYK - Summaries of interesting computer topics
│   └── WTF MAN - Long list of unix commands
├── .nrss
│   └── config - Few rss feeds
├── reaper
│   └── Reaper Shortcuts Jure 04.ReaperKeyMap - My Reaper DAW keymap
├── .bash_aliases - My bash aliases and functions
├── .bashrc - Few aliases that are locale specific
├── install.sh - Installs links to files to coresponding directories
├── README.md - You are here
├── .vimrc - Few vim configurations
├── .Xmodmapsi - Special keymap with capslock as additional modifier
└── .Xmodmapus - Same, but for american layout
```

The two biggest and most important files are .bash_aliases and ./Desktop/WTF MAN. The first one contains my handy bash scripts and aliases. You need .bashrc with this line: `. ~/.bash_aliases` in your home folder, for it to get loaded at console startup. Other big file WTF MAN, contains short explanations and examples of useful unix command. Once installed, they are easyli accesible with this commands: 
	`m1` -> less WTF, `m2` -> less .bash_alisases
	`v1` -> vim WTF, `v2` -> vim .bash_aliases
	`n1` -> nano WTF, `n2` -> nano .bash_aliases
Also note that if you change anything in .bash_aliases, you need to restart bash with `bash` command, or its `ba` alias.

files in detail:
---

### .install.sh:
Executable bash script that creates hard links to all files of the project and places them in home directory. All files that are not at root of a project get their links created in coresponding directories of home directory. If directories don't yet exist, they get created. If file with same name already exists, it is not overwriten, only a warning gets printed. 
To execute it run:
```
gto76@gto76-computer ~ $ ./install.sh
```
Of course you can also create links yourself, or even just copy the files if you don't intend to commit.

### .Xmodmapus, .Xmodmapsi:
![Alt text](/doc/Xmodmapus.png?raw=true "Picture of Keyboard")
### .reaper/Reaper Shortcuts Jure 04.ReaperKeyMap:


### .Desktop/WTF MAN:

### .bashrc:
* Exports path to WTF MAN. It is set to `$HOME/my-aliases/Desktop/WTF MAN`.
* Defines aliases **us** and **si**, that set up my custom keymaps. (see .Xmodmapus, .Xmodmapsi)
* Sets bash to vi mode, makes vim default editor...


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


