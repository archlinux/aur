# Maintainer: John Mylchreest <jmylchreest@gmail.com>
#
# AUR meta-package — installs every official awob listener. No
# payload of its own; pulls each `awob-listener-*-bin` package as a
# dependency. Pair with `awob-bin` for a "kitchen sink" install:
#
#   yay -S awob-bin awob-listeners-all
#
# Tracks awob's release version so users on a freshly-installed
# system can update everything by upgrading `awob-bin` and have all
# listeners follow.

pkgname=awob-listeners-all
pkgver=0.1.7
pkgrel=1
pkgdesc="awob listeners: all official listeners (meta-package)"
arch=('any')
url="https://github.com/jmylchreest/awob"
license=('MIT')
depends=(
    'awob-listener-pipewire-bin'
    'awob-listener-battery-bin'
    'awob-listener-backlight-bin'
    'awob-listener-keyboard-backlight-bin'
    'awob-listener-wob-bin'
    'awob-listener-power-profile-bin'
)

# No source / no install — depends-only meta-package.
package() {
    :
}
