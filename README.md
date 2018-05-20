cups-programme
==============

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



NOTE:

* Setting a primary group to run the command as is only possible when
  the CUPS filter is run as root, and only with some su_variant settings
  ('su', 'sudo' and 'sudo-askpass').

* When the CUPS filter is run, and the command is to be executed as
  another user, the password cannot be input via stdin. So, either a
  sudo-based su_variant has to be used and sudo has to be properly
  configured to allow the wished execution without password entry, or
  some graphical password entry has to be used ('sudo-askpass', 'kdesu'
  and 'kdesudo').

* When adding a printer with this backend via CUPS, you might get an
  error like
  
    Bad device-uri "cups-programme:/usr/bin/gimp?u=felics&D=:0.0&%s".
  
  When this happens, add the printer with a very basic device-uri like
  "cups-programme:/usr/bin/gimp", and after adding the printer, edit
  /etc/cups/printers.conf manually and change the DeviceURI to the
  desired value. (Stop cupsd before, and restart cupsd after editing
  /etc/cups/printers.conf.)


[1]: http://cups.org/
[2]: http://gimp.org/
