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
            'b8c2f27f4cb6c49dc63f6998188ee3a307f3ad7a7dc633c4890404da2890d665')
