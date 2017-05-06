# Maintainer: Michael Spradling <mike@mspradling.com>

. PKGBUILD.common

pkgbase='bareos-x11'

_configure_args="$_configure_args \
    --enable-bat                  \
    --enable-traymonitor          \
    --with-x"

pkgname=("bareos-traymonitor"
         "bareos-bat")

source=("git+https://github.com/bareos/bareos.git#tag=Release/16.2.4"
        "PKGBUILD.common")

sha256sums=('SKIP'
            'fad5eef1cf2fd6b9802f082bce2803b3b3a0eadb58b5da9afea2484a068e134c')
