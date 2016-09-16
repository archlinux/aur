Brutal Doom
===========

[Brutal Doom][8]

Prepare to see the most disturbing, sadistic and morbid manifestation of violence that you ever seen in your life. This is the definitive gameplay enhancement mod for the GZDoom and Zandronum engines.

![Brutal Doom](https://raw.github.com/idk/brutaldoom/master/cover.jpg)
https://www.youtube.com/watch?v=nzsG2sLc7dk&t=1m31s

Includes:
---------

[Version 20b][9]

[Doom Metal Soundtrack Mod Volume 4][10]

Depends:
--------

    pacaur -S gzdoom doomseeker

Install:
--------

	mkdir -p ~/abs/brutal20b
	cd ~/abs/brutal20b
    wget https://raw.github.com/idk/brutaldoom/master/PKGBUILD && wget https://raw.github.com/idk/brutaldoom/master/brutal-doom.install && makepkg -sfi

Setup:
------

Run 'gzdoom' to initialize: (Click cancel after it fails to open if required)

    gzdoom

Ensure all of your existing .wad files use lowercase only, no UpperCase allowed.
Now copy your existing .wad files to ~/.zandronum/:
    
    cp *.wad ~/.config/gzdoom/

Now copy zandronum.ini to ~/.config/gzdoom/:

    cp /usr/share/games/brutal-doom/gzdoom.ini ~/.config/gzdoom/gzdoom.ini

Usage:
------

    zandronum &

Or for Multiplayer:
-------------------

    doomseeker &

Contributing:
-------------

1. Fork it.
2. Create a branch (`git checkout -b my_brutaldoom`)
3. Commit your changes (`git commit -am "Added foo and bar"`)
4. Push to the branch (`git push origin my_brutaldoom`)
5. Create an [Issue][7] with a link to your branch
6. Join the Linux Distro Community IRC or Mumble! :D

SHARE AND ENJOY!
----------------

[linuxdistrocommunity][6]


[6]: http://www.linuxdistrocommunity.com
[7]: https://github.com/idk/brutaldoom/issues
[8]: http://www.moddb.com/mods/brutal-doom
[9]: http://www.moddb.com/downloads/brutal-doom-version-181
[10]: http://www.moddb.com/mods/brutal-doom/downloads/doom-metal-soundtrack-mod-volume-4
