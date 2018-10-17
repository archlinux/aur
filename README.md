# Why

Since [`ncurses` 6.1](https://www.gnu.org/software/ncurses/#h3-programs)

`tic` and `infocmp` display numeric values in hexadecimal when they are "close"
to a power of two, "making the result more readable". This causes issues for
`sbt` and and other programs using `jline < 2.14.4`. This package aims to
provide a fix for that.

## ncurses-nohex

The `ncurses-nohex` package applies a patch that undo this functionality. The
package replaces ncurses in full.

## infocmp-nohex

`infocmp-nohex` works with any build of ncurses by installing the `infocmp`
binary to /usr/local/bin, effectively shadowing the normal infocmp. It's a bit
of a hack but it works.