# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=zendframework2-apidoc
pkgver=2.4.7
pkgrel=1
pkgdesc="API Documentation for ZendFramework2"
arch=('any')
url="http://framework.zend.com/"
license=('BSD')
options=(!strip)
source=("http://packages.zendframework.com/releases/ZendFramework-$pkgver/ZendFramework-$pkgver-apidoc.tgz")
sha256sums=('b931a0334c353626505795ca50302d34d413ce5e0b28e60d2f53e4d0496d99f4')

build() {
    true
}

package() {
    cd "$srcdir/ZendFramework-$pkgver-apidoc"
    install -d "$pkgdir/usr/share/doc/zendframework2/api" 
    cp -R . "$pkgdir/usr/share/doc/zendframework2/api"
}
