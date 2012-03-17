PKGBUILD for context-minimals
=============================

[The ConTeXt Minimal](http://wiki.contextgarden.net/ConTeXt_Minimals) (now
called ConTeXt standalone) is a complete, up-to-date ConTeXt distribution. It's
main feature is that, unlike Texlive, it provides an isolated installation of
ConTeXt that is easy to update. The Minimals target ConTeXt users and does not
include LaTeX specific packages and binaries.

This PKGBUILD provides an easy way to install the Minimals at

    /opt/context-minimals

## Installation

Although you can use an [AUR helper](https://wiki.archlinux.org/index.php/AUR_Helpers)
to install ConTeXt, I would recommend manual installation (as described below).
Manual installation offers two advantages: fewer files to download over time,
and the ability to revert back to an older version. Most AUR helpers install
packages in the `$TMP` directory, so the previously downloaded files are deleted
when you reboot. This is fine for binary packages, but leads to unnecessary
re-downloads for ConTeXt. 

ConTeXt consits of various macro files and a few binaries. Most of the macros
files do not change from release to release. So, ConTeXt provides an `rsync`
based update mechanism that only downloads the files that have changed. This
`PKGBUILD` simply provides a wrapper around the ConTeXt update script. 

Now, if the previously downloaded files are deleted at the time of upgrade, the
ConTeXt upgrade script will have to download all files again. To avoid that it
is better to manually install the package from a permanent directory.

An additional adavantage of this approach is that the packaged version of old
installations are not deleted automatically. So, you can revert to an older
installation if needed (or delete the older `*-pkg.tar.gz` files if you want).

To the install the package manually, choose a permant installation directory. I
normally use `$HOME/Software/context-pkgbuild`. Then follow the following steps

1. `cd $HOME/Software/context-pkgbuild`
2. `git clone git://github.com/adityam/context-pkgbuild.git .`
3. `makepkg`
  
    This step generates a `context-minimals-<date>.pkg.tar.gz` file. 

4. `sudo pacman -U context-minimals-<date>.pkg.tar.gz`

    This step installs the files in `/opt/context-minimals`

## Use

The main feature of the ConTeXt minimal distribution is that it may be installed
in parallel to Texlive. As such, the installation does not place any binaries in
the default `$PATH`, rather places them in a sub-directory in
`/opt/context-minimals`. To use ConText minimals, you need to initialize `$PATH`
and some TeX related variables using

    source /opt/context-minimals/setuptex

When running MkIV for the first time after installation or update, source
`setuptex` and then run

    mtxrun --generate

as a normal user (**and not as root**). 

Report any bugs at the ConTeXt [mailing list](http://wiki.contextgarden.net/ConTeXt_Mailing_Lists).
or on the [Issues](https://github.com/adityam/context-pkgbuild/issues) page on
github.



