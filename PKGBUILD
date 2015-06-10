# Maintainer: Michael Spradling <mike@mspradling.com>

. PKGBUILD.common

pkgbase='bareos-x11'
_configure_args="$_configure_args \
    --enable-bat                  \
    --enable-traymonitor          \
    --with-x"

pkgname=("bareos-traymonitor"
         "bareos-bat")
source=("https://github.com/bareos/bareos/archive/Release/${pkgver}.tar.gz"
        "PKGBUILD.common")
sha256sums=('f42bc34afa913cfb4d6b7ef8856c7195d8b13b21c987da1039d46e6c60f06720'
            '56eb1e45003fa2de137333bfc74a85518b0dae21c50e49f48df44c2e63bb3ebf')
