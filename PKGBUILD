# Maintainer: MarkGMX8X <inspace2025@mail.ru>

pkgname=papt2
pkgver=0.9.5
pkgrel=1
pkgdesc="pacman and yay wrapper with apt-like syntax for Arch Linux"
arch=('any')
url="https://github.com/MarkGMX8X/papt2"
license=('GPL-3.0-only')
depends=('python' 'pacman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MarkGMX8X/papt2/archive/refs/tags/Papt2_0xx.tar.gz")
sha256sums=('9a5658a3d6ad4d9b67aa4b16c3afb311ef577b6cd9d8321d0eae4f7435413011')

package() {
    cd "$srcdir/$pkgname-Papt2_0xx"
    install -Dm755 papt "$pkgdir/usr/bin/papt2"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
