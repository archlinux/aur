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

sha256sums=('020b974b54f10d245ee920dd3144827ef32588599e703e4f3ce1c913a0201160'
            '4323ea77dc3c370c130d801887d871cdb2aed9f4f251ec63d85b6e80ca7c1f0e')
