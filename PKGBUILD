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

sha256sums=('37821804727f06c58badc2b738ea2be5237111726c89f1306c1926cba261fc55'
            'c88808f38880d4b0eaffe5f4f3d71f6336e9cf20c63de9ea216b7ef542410c91')
