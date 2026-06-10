# Maintainer: Mark <inspace2025@mail.ru>

pkgname=papt3
conflicts=('papt' 'papt2')
provides=('papt')
pkgver=0.9.6
pkgrel=1
pkgdesc="pacman and yay wrapper with apt-like syntax (auto AUR)"
arch=('any')
url="https://github.com/MarkGMX8X/papt3"
license=('GPL-3.0-only')
depends=('python' 'pacman' 'yay')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MarkGMX8X/papt3/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8265ebbcba790ae9600ec7cd804ab17f07aa2bc047bff29e7fb3aeed66c5436c')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 papt "$pkgdir/usr/bin/papt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}