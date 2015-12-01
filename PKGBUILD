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

sha256sums=('7c7e07c877956385870475382184d39df7232ecd9791c3a3942624473410da93'
            '8153e56e839ec2ceea275a3e49f0302994a8f5875b062f0f46c8e4df89b5a9e8')
