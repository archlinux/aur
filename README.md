ib-tws Package Helpers
======================

Source and helpers for the [Interactive Brokers]
(http://interactivebrokers.com/) Traders Workstation [ib-tws]
(https://aur.archlinux.org/packages/ib-tws/) AUR package.

This project assists maintain ib-tws. It is necessary because TWS is
downloaded from a generic, non-versioned URL. The downloaded file does
not provide a version number, instead requiring execution of the software
to determine the version. These conditions complicate maintenance of the
Arch package, as the package must report the correct TWS version number
plus reflect the md5sum of the currently-available TWS URL.

Setup
-----

Install software:

     sudo pacman -S wget java-environment bash base-devel namcap pkgbuild-introspection

If you are the current AUR maintainer, setup burp:

     sudo pacman -S burp
     mkdir -p $XDG_CONFIG_HOME/burp
     echo 'User=something' > $XDG_CONFIG_HOME/burp/burp.conf
     echo 'Password=something' >> $XDG_CONFIG_HOME/burp/burp.conf

Clone as follows (if you are the current AUR maintainer, use your own
fork as the `upload` script will push commits to your repository):

     git clone git://github.com/benalexau/ib-tws.git
     cd ib-tws
     git submodule init
     git submodule update

From ib-tws, add symbolic links for the utilities:

     ln -s `pwd`/tws_scripts/tws_get_version $HOME/bin/tws_get_version
     ln -s `pwd`/tws_scripts/tws_check_update $HOME/bin/tws_check_update

Verify correct execution by running `tws_check_update`. It should report
a TWS version number and store files in `$HOME/.tws_scripts/`.

Usage
-----

If you *are not* the current AUR maintainer, run `update`. This will:

* Run `tws_check_update`
* Update the `PKGBUILD` to reflect the reported version and hash codes
* Build the package, including a source version
* Run `namcap` to verify package quality (the build will fail if any
  warnings are reported)

If you *are* the current AUR maintainer, run `upload`. This will:

* Run `update` (refer above)
* If any changes were made, `burp` is used to upload the new version
* If any changes were made, a Git commit and push is performed

If you are the current AUR maintainer but used `tws_check_update` and it
updated the version, simply `rm $HOME/.tws_scripts/` and use `upload`.

License
-------

All contents of this repository are provided under the
[Apache License, Version 2.0]
(https://www.apache.org/licenses/LICENSE-2.0.html).
