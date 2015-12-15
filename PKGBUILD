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

sha256sums=('f314e7d3e99e92b4261af97888ddcdaaedf513b638745b07270db3e6930e9008'
            '9af9acc9b3981c92cb0edaaf9b3b1453039d4f8d18042a7697872fb56d9003ae')
