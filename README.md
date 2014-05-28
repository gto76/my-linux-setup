My Aliases
==========

Basicly my config files, three handy text files and an install script to put them all in a right place.

quick overwiev:
---

```
.
├── Desktop
│   ├── ETC - List of thigs I first set up on a fresh install
│   ├── NYK - Summaries of interesting computer topics
│   └── WTF MAN - Long list of unix commands
├── .nrss
│   └── config - List of few rss feeds
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


.bash_aliases:
----
My own .bash_aliases and a list of interesting linux commands (Desktop/HUDI TERMINAL UKAZI).
Besides a lot of useful aliases, there are also some interesting functions, such as:

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


