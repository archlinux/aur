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
            '44f533b3b0e52ac0cc6a296231bb1fd982b7ec523d44ecc1e72e38b285c19d41')
