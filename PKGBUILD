# Maintainer: André Missaglia <andre.missaglia@gmail.com>
pkgname=kcompose
pkgver=0.4.0
pkgrel=1
pkgdesc="Utility tool for managing kafka"
arch=('any')
url="https://github.com/andremissaglia/kcompose"
license=('GPL3')
depends=('java-runtime' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andremissaglia/kcompose/archive/$pkgver.tar.gz")

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir/" ./install.sh
}
md5sums=('d09f573086b2dd248a789331102cb978')
