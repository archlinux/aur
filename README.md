This was made for Arch and Arch-based Linux distros; it will work on other distros, but you should manually edit some things in the main script.

To install via git, just clone the repo:
$ git clone https://github.com/davyidx/attofetch

Get inside the downloaded folder:
$ cd attofetch

And build the package:
$ makepkg -si

The package itself is pretty minimal and straightforward, you will need bash, base-devel and git to clone it.
Run the script anywhere; execute "attofetch".
You can configure colors, ascii art, and text format; edit the .cfg file at /etc/attofetch.cfg.

Configuration:
(file path: /etc/attofetch.cfg)

ascii: this is the ascii art to display, the directory for these is /usr/share/attofetch

st_title: this is the first argument of ANSI escape for titles, commonly used for bold characters.
st_body: same for body.
st_ascii: same for ascii.

nd_title: this is the second argument of ANSI escape for titles, commonly used for coloring.
st_body: same for body
st_ascii: same for ascii

x_padding: text padding in spaces from ascii.
y_padding: text padding in lines from top.

Table of ANSI escape codes: https://gist.github.com/JBlond/2fea43a3049b38287e5e9cefc87b2124
