# Maintainer: Sleep-No-More <sleepnomore@example.com>
pkgname=cpmenu
pkgver=0.2.2
pkgrel=1
pkgdesc="Modern circular power menu for Wayland desktop environments"
arch=('x86_64')
url="https://github.com/Sleep-No-More/cpmenu"
license=('MIT')
depends=('gtk3' 'cairo')
source=("https://github.com/Sleep-No-More/cpmenu/releases/download/v${pkgver}/cpmenu")
sha256sums=('06b19fa49bdd10279c0f09ef18dde04c76d81a882b5a9cd34fcfd8c4f4817f04')

package() {
    install -Dm755 "cpmenu" "$pkgdir/usr/bin/cpmenu"
}
