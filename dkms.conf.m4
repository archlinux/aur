define(`upcase', `translit(`$*', `a-z', `A-Z')')dnl
define(`surround', `$1$2$1')dnl
define(`makepkg_var', `surround(`__', upcase(`$1'))')dnl
define(`dquoted', `surround(`"', `$1')')dnl
PACKAGE_NAME=dquoted(makepkg_var(`_pkgname'))
PACKAGE_VERSION=dquoted(makepkg_var(`pkgver'))
CLEAN="make KVERSION=$kernelver clean"
MAKE[0]="make KVERSION=$kernelver"
BUILT_MODULE_NAME[0]="substr(makepkg_var(`_pkgname'), 0, eval(len(makepkg_var(`_pkgname')) - 2))"
DEST_MODULE_LOCATION[0]="/extra"

AUTOINSTALL="yes"
