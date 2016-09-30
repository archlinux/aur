# Maintainer: Michael Spradling <mike@mspradling.com>

. PKGBUILD.common

pkgbase='bareos-x11'

_configure_args="$_configure_args \
    --enable-bat                  \
    --enable-traymonitor          \
    --with-x"

pkgname=("bareos-traymonitor"
         "bareos-bat")

source=("http://download.bareos.org/bareos/release/16.2/Debian_8.0/bareos_${_pkgver}.orig.tar.gz"
        "PKGBUILD.common")

sha256sums=('920196b9e07044a99c2a9146bc90ddec9c3820839b20a0b38d72c4a4aaaa0f7a'
            '7c0ddad01de8194b5e5dfd3c7ad13439a65966452c74c7a528566e3398c9f9c4')
