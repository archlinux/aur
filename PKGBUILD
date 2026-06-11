# Maintainer: Mark <inspace2025@mail.ru>

pkgname=papt
conflicts=('papt2' 'papt3')
provides=('papt')
pkgver=0.9.6.1
pkgrel=1
pkgdesc="A wrapper for pacman with apt-like syntax. Simple package management for Arch Linux."
arch=('any')
url="https://github.com/MarkGMX8X/papt"
license=('GPL-3.0-only')
depends=('python' 'pacman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MarkGMX8X/papt/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('516c9d2e21a9ed47f12d2a9ab4c92ad5287c8eca5621e1813d96f8678be27064')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 papt "$pkgdir/usr/bin/papt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}