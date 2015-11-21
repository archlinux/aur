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

sha256sums=('e8f5b2c8635985abce68b057585db9d2b7abf3e394bc2b34cb3fbd6ebfed6d3b'
            '0819fdf926a4c256efe4ed74cfa850815148d43cdbbe661d5ddd372954be8122')
