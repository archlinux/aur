cups-programme
==============

http://felics.kettenbruch.de/software/cups-print-to-programme/

This is a filter for CUPS -- the [Common Unix Printing System][1] --
that will allow to create virtual printers to open the printed file in
an application.

The use case it was created for: The author of this software has a
printer which can only print black and white, and grayscales get
pixeladet due to dithering. Having small fonts in not 100% black makes
the text hardly readable because not all pixels are printed. With this
CUPS filter, the author can print from any application into The Gimp --
[GNU Image Manipulation Program][2] -- make exactly black & white there,
and print from The Gimp to the real printer.


Installation
------------

Install the printer backend executable to the path where CUPS stores
it's backends, and name it as the executable reports in the second
word when called with no arguments (=`cups-programme`). Under Arch Linux
and probably most other UNIX systems CUPS printer backends are in
`/usr/lib/cups/backend`, so you would install this print backend to
`/usr/lib/cups/backend/cups-programme`. Make sure it is executable by
at least the user `cupsd` runs as (e.g. `lp`), but beeing executable by
all is just fine. Make sure it is only writable by `root`, otherwise
CUPS will refuse to start the filter.

Install the configuration file to `/etc/cups/cups-programme.conf`, and
make sure it is readable at least by the user `cupsd` runs as.


Adding printers
---------------

This printer can be added using the CUPS webinterface with probably one
manual intervention.

When the backend has been properly installed, CUPS will show it under
"Local Printers" when you click "Add Printer" in the webinterface.
Select the printer. In the field "Connection", you need to specify the
Device URI. This is the part where the cups-programme printer get's
it's information which programme to execute.

The Device URI to print to The Gimp is, for example:

    cups-programme:/usr/bin/gimp?u=.CUPSUSER&DISPLAY=%C0.0&%s

where `.CUPSUSER` will be replaced by the user who invoked the CUPS
print job (if CUPS can infer; otherwise most probably it will be the
user CUPS runs it's backends as, e.g. `lp`) ind will be the user `gimp`
should be run as. If `u=[...]` is not specified, it will be run as the
user CUPS is running it's backends as, which might not be desired. The
`DISPLAY=%C0.0` specifies the X11 display to use. In most cases, `:0.0`
is correct (`%C` will be replaced by `:`).

See section "Device URI syntax" for a full description of the Device
URI.

After the Device URI has been entered, select a name and optionally a
description and a location note for the printer. Then you are presented
with a list of printer manufacturers and models to choose from. Select
the manufacturer `Generic` and any generic PostScript printer. (This
selects a PPD file for the printer. Since we just want to open (or later
convert -- see section "Configuration File") the raw CUPS PostScript
output, just select any PostScript printer and then ignore the printer
options is fine.)

Adding the printer might fail with an error like

    Bad device-uri "cups-programme:/usr/bin/gimp?[...]"

In this case, when specifying the Device URI, just type in
`cups-programme:<path-to-executable>` (e.g.
`cups-programme:/usr/bin/gimp`) and add the printer as described. After
the printer has been added, stop CUPS (e.g. by entering
`systemctl cupsd stop` or `/etc/init.d/cupsd stop` as root on the
command line) and edit the file `/etc/cups/printers.conf`. Find the
printer you just added and complete the Device URI manually by editing
the entry starting with `DeviceURI`. Save your edits, and start CUPS
again (e.g. by typing `systemctl start cupsd` or
`/etc/init.d/cupsd start`).

Now the virtual printer should be functional.


Device URI syntax
-----------------

In general, the syntax for the Device URI is:

    cups-programme:<path-to-executable>?<options>

where:

* Only the charaters out of the set
    [][)(}{äÄöÖüÜß.:,;_@^°§%&/=?+*~a-zA-Z0-9-]
  are allowed. (Use `%`-replacements, if you need some of forbidden,
  characters, see below. For example, the characters ` `, `"`, `'`,
  `` ` ``, `$`, `!`, `#`, `<`, `>`, `|`, `\` are forbidden.)
* `<path-to-executable>` needs to be an absolute path, starting with `/`
  (otherwise CUPS will complain that it is not a correct URI; it expects
  a `/` after the `:`),
* `?<options>` is optional and has the syntax
  `?<option>&<option>&<option>` etc. (arbitraryly many options,
  separated by `&`, are allowed).
  an `<option>` can be of the form:
  - `u=<user>` -- specifies that the executable should be run as user
    `<user>`. If `<user>` is the special word '.CUPSUSER', then the
    executable will be run as the print-job invocing user CUPS reports
    to the backend. (see also explanation of `su_variant` in the section
    "Configuration File"),
  - `g=<group>` -- specifies that the executable should be run with
    primary group `<group>` (see section "Notes"),
  - `t=<filetype>` -- if set, CUPS' PostScript output will be converted
    to `<filetype>`. Possible values for `<filetype>` are:
    + 'ps' (PostScript; retain CUPS' default),
    + 'pdf' (PDF; uses 'ps2pdf'),
    + 'svg' (SVG; uses 'pdf2svg'),
    + 'png' (PNG; uses ImageMagick or GraphicsMagick),
    + 'gif' (GIF; uses ImageMagick or GraphicsMagick),
    + 'jpg' (JPEG; uses ImageMagick or GraphicsMagick),
    + 'tif' (TIFF; uses ImageMagick or GraphicsMagick),
  - `<variable>=<value>` -- assigns `<value>` to the environment
    variable `<variable>` and exports `<variable>`,
  - anything else will be passed as positional arguments to
    the executable.
* On `<path-to-executable>` and all the options (except `t=<filetype>`),
  the following string substitutions are applied (see also "Notes"):
  - `%A`  -> `&`,
  - `%AT` -> `@`,
  - `%B`  -> `\`,
  - `%C`  -> `:`,
  - `%D`  -> `$`
  - `%E`  -> `=`,
  - `%H`  -> `#`,
  - `%L`  -> `<`
  - `%LC` -> `{`
  - `%LR` -> `(`
  - `%LS` -> `[`
  - `%P`  -> `|`,
  - `%Q`  -> `?`,
  - `%R`  -> `>`
  - `%RC` -> `}`
  - `%RR` -> `)`
  - `%RS` -> `]`
  - `%TB` -> `` ` `` (backtick),
  - `%TD` -> `"`,
  - `%TS` -> `'`,
  - `%X` -> `!`
  - `%s`  -> The file where the CUPS print output is saved. Use `%s` to
    pass the printed file to be opened to the executable.
  - `%.`  -> ` `,
  - `%_`  -> `-`,
  - `%%`  -> `%`.
  These replacements are carried out after cups-programme has parsed the
  Device URI, so e.g. `%E` can be used to escape a `=` from
  cups-programme's parser, e.g. to pass `u=...` as argument to the
  executable.


Configuration File
------------------

The printer backend expects a configuration file to be present at
`/etc/cups/cups-programme.conf`. This file will be bash-sourced, so
beware what you do there.

The following variables are to be set in the configuration file:
`su_variant`, `askpass_cmd` and `image_converter`.

* The executable whill be run in `bash`, but the the command and all
  arguments /should/ be properly quoted by cups-programme so that `bash`
  will not perform substitutions.

* When a programme should be run as a specific user (`u=<user>` in the
  Device URI) or with a specific primary group (`g=<group>` in the
  Device URI), some programme like `su` or `sudo` needs to be invoked.
  However, things are not that simple, because there is no terminal
  access and so no password can be typed in easily. Here, the
  configuration variable `su_variant` comes in the game. Ut can be
  choosen between a few methods to authenticate.
  
  One possibility is to use `sudo` and to configure your system's sudo
  such that no password is required. Another possibility is to use a
  graphical password entry -- via a graphical programme, or via `sudo`
  with askpass (`su_variant=sudo-askpass`).

* When `su_variant=sudo-askpass` is set, then `askpass_cmd` needs to be
  set and needs to contain a full path to an askpass executable.

* If the `t=<filetype>` option in the Device URI specifies a pixel
  graphic format, then `image_converter` must be set. It specifies if
  ImageMagick or GraphicsMagick is to be used when converting to a pixel
  graphic.

Read the comments in the configuration file for further details, e.g.
supported values.


Notes
-----

* The `%`-substitutions in the options in the Device URI might also
  become necessary if the characters are breaking the Device URI, even
  if the characters are allowed by cups-programme itself.

* Setting a primary group to run the command as is only possible when
  the CUPS filter is run as root, and only with some `su_variant`
  settings (for details, see comments in the configuration file).

* When adding a printer with this backend via CUPS, you might get an
  error like
  
    Bad device-uri "cups-programme:/usr/bin/gimp?u=user&DISPLAY=:0.0&%s".
  
  When this happens, add the printer with a very basic Device URI like
  `cups-programme:/usr/bin/gimp`, and after adding the printer, edit
  `/etc/cups/printers.conf` manually and change the `DeviceURI` to the
  desired value. (Stop `cupsd` before, and restart cupsd after editing
  `/etc/cups/printers.conf`.)


[1]: http://cups.org/
[2]: http://gimp.org/
