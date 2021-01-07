# Maintainer: André Missaglia <andre.missaglia@gmail.com>
pkgname=kcompose
pkgver=0.8.0
pkgrel=1
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
md5sums=('84459587d9b4cde2ab598d2cb8dec08e')
