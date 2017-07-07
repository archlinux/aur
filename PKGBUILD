# Maintainer: Michael Spradling <mike@mspradling.com>

. PKGBUILD.common

pkgbase='bareos-x11'

_configure_args="$_configure_args \
    --enable-bat                  \
    --enable-traymonitor          \
    --with-x"

pkgname=("bareos-traymonitor"
         "bareos-bat")

source=("git+https://github.com/bareos/bareos.git#tag=Release/16.2.6"
        "PKGBUILD.common")

sha256sums=('SKIP'
            'f63eb850f4ac25ef5d9539b5e03163d58445c66bc29bd11649c4580e612d44ac')
