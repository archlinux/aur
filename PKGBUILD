# Maintainer: André Missaglia <andre.missaglia@gmail.com>
pkgname=kcompose
pkgver=0.6.0
pkgrel=2
pkgdesc="Utility tool for managing kafka"
arch=('any')
url="https://github.com/arquivei/kcompose"
license=('GPL3')
depends=('java-runtime' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arquivei/kcompose/archive/$pkgver.tar.gz")

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir/" ./install.sh
}
md5sums=('dda2d41733d38d4d948dc5ef77d32b33')
