# Maintainer: MarkGMX8X <inspace2025@mail.ru>

pkgname=papt
pkgver=0.9.5
pkgrel=1
pkgdesc="A wrapper for pacman with apt-like syntax. Simple package management for Arch Linux."
arch=('any')
url="https://github.com/MarkGMX8X/papt"
license=('GPL-3.0-only')
depends=('python' 'pacman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MarkGMX8X/papt/archive/refs/tags/Papt_0xx.tar.gz")
sha256sums=('0bfb95cd4c8ec794f0c09ba1101808f2d25c432924f0bbf33e9628b68c800339')

package() {
    cd "$srcdir/$papt-Papt_0xx"
    install -Dm755 papt "pkgdir/usr/bin/papt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
