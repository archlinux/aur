# Maintainer: Sleep-No-More <sleepnomore@example.com>
pkgname=cpmenu
pkgver=0.2.3
pkgrel=1
pkgdesc="Modern circular power menu for Wayland desktop environments"
arch=('x86_64')
url="https://github.com/Sleep-No-More/cpmenu"
license=('MIT')
depends=('gtk3' 'cairo')
source=("https://github.com/Sleep-No-More/cpmenu/releases/download/v${pkgver}/cpmenu")
sha256sums=('98a2f1ff1b318374aec09715fcb2f878b3bacd2b3362f0525b9a57005079e793')

package() {
    install -Dm755 "cpmenu" "$pkgdir/usr/bin/cpmenu"
}
