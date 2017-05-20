# PKGBUILD for rxvt-unicode with support for displaying wide glyphs

This PKGBUILD builds urxvt-unicode with the patch from
https://github.com/blueyed/rxvt-unicode/tree/display-wide-glyphs to display
glyhps that are too wide instead of a square.

urxvt considers the font to be broken, e.g. if the glyph is wider than the
number of cells that `wcwidth(3)` reports.  This gets better with Unicode 9
(since e.g. more characters are assigned a width of 2), but it does not help
with characters from the Private Use Area (e.g. Font Awesome).

I am coming back to this approach after
https://github.com/blueyed/rxvt-unicode/pull/1 turned out to be too fragile:

1. the method of using a socket for communication fails for remote
   applications, and already when re-attaching to a tmux session after closing
   the terminal it was started from (where the terminal cannot respond to
   requests on the socket then anymore).
2. using OSC terminal escape sequences also does not work with tmux (server),
   and other applications that have no tty attached.


Included in Arch's user repository (AUR): https://aur.archlinux.org/packages/rxvt-unicode-cvs-patched-wideglyphs/
