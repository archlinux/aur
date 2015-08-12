# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=zendframework2
pkgver=2.4.7
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
sha256sums=('33f8c7dbe25cceabfeab91dcf981606b2952dffa59f84ca04fb85282ed9f20ce')

build() {
    true
}

package() {
    cd "$srcdir/ZendFramework-$pkgver"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cp -R . "$pkgdir/usr/share/$pkgname"
}
