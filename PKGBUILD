# Maintainer: Sleep-No-More <sleepnomore@example.com>
pkgname=cpmenu
pkgver=0.2.1
pkgrel=1
pkgdesc="Modern circular power menu for Wayland desktop environments"
arch=('x86_64')
url="https://github.com/Sleep-No-More/cpmenu"
license=('MIT')
depends=('gtk3' 'cairo')
source=("https://github.com/Sleep-No-More/cpmenu/releases/download/${pkgver}/cpmenu")
sha256sums=('d2f065de4a90050dfd62b220810e406b1f999726d244224575ac3b7d774a189c')

package() {
    install -Dm755 "cpmenu" "$pkgdir/usr/bin/cpmenu"
}
