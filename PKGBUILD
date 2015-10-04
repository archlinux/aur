# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=zendframework2
pkgver=2.4.8
pkgrel=1
pkgdesc="An object-oriented framework for PHP - Full version"
arch=('any')
url="http://framework.zend.com/"
license=('BSD')
depends=('php>=5.3.23')
options=(!strip)
optdepends=()
conflicts=('zendframework2-min' 'zendframework2-git')
source=("http://packages.zendframework.com/releases/ZendFramework-$pkgver/ZendFramework-$pkgver.tgz")
sha256sums=('1bac9d0242594459fb127dcac9e54eb699175192165b1fb3dbbf0ba2a3166492')

build() {
    true
}

package() {
    cd "$srcdir/ZendFramework-$pkgver"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -R . "$pkgdir/usr/share/$pkgname"
}
