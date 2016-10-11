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

sha256sums=('584aea278ab6548bef958e383036a13e4bfff6b0355d2cfd2e4e30268b63cb47'
            '40252e18e72f8492a91d46ca8bbb7b6e1205864a86836133c093b8f50597b342')
