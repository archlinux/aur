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

sha256sums=('dde2b0b1ed8d878f9731cee9c7f723e3bac479b5fb367e61efca636465b40ebb'
            'f864fd8267764ead7c83c5999dc780a8c37e4755842b036910416128288fd280')

