# neovim-gnome-terminal-wrapper

![screenshot](screenshot.gif)

Wraps the neovim binary in a separate gnome-terminal session, making it
possible to use it as a regular application (it is tracked correctly by the DE,
it can be associated to filetypes, etc.)

## Requisites

* neovim
* gnome-terminal >= 3.16 (uses gnome-terminal-server)
* python-dbus

## Setup

On Arch, install `neovim-gnome-terminal-wrapper` from the AUR.

Manually:

~~~
cp nvim-wrapper /usr/bin/nvim-wrapper
cp neovim.desktop /usr/share/applications/neovim.desktop
cp neovim.svg /usr/share/icons/neovim.svg
~~~

### Caveats when using running from virtual environments

Some users have experienced trouble running nvim-wrapper when inside a virtual environment created by e.g. virtualenv, conda or similar.
One workaround is to point the nvim-wrapper script directly to the right (system) python3 executable, i.e. change: 

~~~
#! /usr/bin/env python3
~~~

into:

~~~
#! /usr/bin/python3
~~~

After this, make sure the neovim python package is installed from the correct package manager, e.g. in Ubuntu:

~~~
/usr/bin/pip3 install --user neovim
~~~
