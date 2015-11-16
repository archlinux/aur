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
            'a76f47b2cdfaede8bba6f1c658afed999260bb267fe7cba48255ce1a73796b06')
