# Maintainer: Sujal Vijayaraghavan

pkgname=matlock
pkgver=1.0.0
pkgrel=5
pkgdesc='Screen lock program for X like in The Matrix (1999)'
arch=('x86_64' 'aarch64')
url="https://github.com/sujaltv/matlock"
license=('MIT')
depends=('libxext' 'libxrandr')
makedepends=('make' 'git')
source=("https://github.com/sujaltv/matlock/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e4287b3cea10ee8e0b65b2086b61dbe321727a58a8d17832c0611dad3c3cbb75')

package() {
    cd $pkgname-${pkgver}
    make PREFIX=/usr DESTDIR="$pkgdir" instal
    install -m 644 -D LICENCE "$pkgdir/usr/share/licenses/${pkgname}/LICENCE"
    pwd
}
