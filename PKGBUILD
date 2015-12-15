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
            '8153e56e839ec2ceea275a3e49f0302994a8f5875b062f0f46c8e4df89b5a9e8')
