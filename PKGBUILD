# Maintainer: Michael Spradling <mike@mspradling.com>

. PKGBUILD.common

pkgbase='bareos-x11'

_configure_args="$_configure_args \
    --enable-bat                  \
    --enable-traymonitor          \
    --with-x"

pkgname=("bareos-traymonitor"
         "bareos-bat")

source=("git+https://github.com/bareos/bareos.git#tag=Release/16.2.5"
        "PKGBUILD.common")

sha256sums=('SKIP'
            '192c5714b1d26a35cd32437effb7745e0d52c39600aea87e069b84bf32230797')
