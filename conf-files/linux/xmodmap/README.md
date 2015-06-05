My Linux Keymaps
================

Keymaps that make CapsLock an additional modifier key. With it pressed, the keys under your right arm become numpad keys (the ones with NumLock off, e.g. Arrows, Home, End, PgUp...), but with few additions like: 'k' key that corresponds to '5' on a numpad becomes down key, 'p' becomes backspace, ';' enter, '/' delete, and "'" escape. Also space becomes enter, backspace delete, '`' escape, all the number keys their corresponding F keys and Insert key becomes CapsLock. There is also a Vi variation, which has directional keys positioned in Vi style and Home, End, PgUp, PgDn keys a little shifted around. Here are the two American versions:
- **.Xmodmapus**

![Alt text](/doc/Xmodmapus.png?raw=true "Picture of Keyboard")

- **.Xmodmapusvi**

![Alt text](/doc/Xmodmapusvi.png?raw=true "Picture of Keyboard")

Also present are Slovenian versions: [**`.Xmodmapsi`**](dotfiles/.Xmodmapsi) and [**`.Xmodmapsivi`**](dotfiles/.Xmodmapsivi). Slovenian layout is basically the same as German with letters 'čćšđž' in place of 'umlauted' letters. 

How to set keymap
-----------------

Warning: For keymaps to work, it is mandatory that layout for that language is set before `xmodmap` is run. For example if American layout is selected and we want Slovenian we need to type:
```
	setxkbmap -layout si
	xmodmap ~/.Xmodmapsi
```
In [**`.my_bashrc`**](dotfiles/.my_bashrc) there are aliases that do this for you:
* **`us`** - American layout,
* **`usvi`** - vi variation of American layout,
* **`si`** - Slovenian layout and
* **`sivi`** - vi variation of Slovenian layout.

If you want a particular keymap to get loaded when X starts (at least for Mint/Debian), go to Startup Applications and add new application: `xmodmap $HOME/.Xmodmapus` with 2 second delay.
