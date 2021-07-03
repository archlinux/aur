# Maintainer: André Missaglia <andre.missaglia@gmail.com>
pkgname=kcompose
pkgver=0.9.2
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
md5sums=('cf2cbed90c0266f11f371f3274aacb8a')
