# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=zendframework2-apidoc
pkgver=2.4.2
pkgrel=1
pkgdesc="API Documentation for ZendFramework2"
arch=('any')
url="http://framework.zend.com/"
license=('BSD')
options=(!strip)
source=("http://packages.zendframework.com/releases/ZendFramework-$pkgver/ZendFramework-$pkgver-apidoc.tgz")
sha256sums=('07e32e4fafa5ff8c3dc67785d6e8187c760792e4de3b383958b0a3805028ac43')

build() {
    true
}

package() {
    cd "$srcdir/ZendFramework-$pkgver-apidoc"
    install -d "$pkgdir/usr/share/doc/zendframework2/api" 
    cp -R . "$pkgdir/usr/share/doc/zendframework2/api"
}
