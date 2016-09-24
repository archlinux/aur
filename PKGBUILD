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
            '518cb7c5417707245e19b2667ab4109f4984c17193cf94ed21c02b739baf8232')
