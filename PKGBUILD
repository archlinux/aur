# Maintainer: Mark <inspace2025@mail.ru>

pkgname=papt2
conflicts=('papt' 'papt3')
provides=('papt')
pkgver=0.9.6.1
pkgrel=1
pkgdesc="pacman and yay wrapper with apt-like syntax for Arch Linux"
arch=('any')
url="https://github.com/MarkGMX8X/papt2"
license=('GPL-3.0-only')
depends=('python' 'pacman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MarkGMX8X/papt2/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('276125c62f3dc5a2210820bc0ed183af506a8b8c8adb91df653c55d258567410')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 papt "$pkgdir/usr/bin/papt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
