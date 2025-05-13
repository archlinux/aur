This was made for Arch and Arch-based Linux distros; it will work on other distros, but you should manually edit some things in the main script.

To install via git, just clone the repo:
$ git clone https://github.com/davyidx/attofetch

Get inside the downloaded folder:
$ cd attofetch

And build the package:
$ makepkg -si

The package itself is pretty minimal and straightforward, you will need bash, base-devel and git to clone it.
Run the script anywhere; execute "attofetch".
You can configure colors, ascii art, and text format; edit the main script at /usr/share/attofetch/attoscript.sh or view it in this website for more information on how to configure the tool.
