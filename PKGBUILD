# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=zendframework2-apidoc
pkgver=2.4.6
pkgrel=1
pkgdesc="API Documentation for ZendFramework2"
arch=('any')
url="http://framework.zend.com/"
license=('BSD')
options=(!strip)
source=("http://packages.zendframework.com/releases/ZendFramework-$pkgver/ZendFramework-$pkgver-apidoc.tgz")
sha256sums=('b470415e37c843fb67c05bc01c9f9a78e3b6fe3a4f1febe5bf11fd223aa9412e')

build() {
    true
}

package() {
    cd "$srcdir/ZendFramework-$pkgver-apidoc"
    install -d "$pkgdir/usr/share/doc/zendframework2/api" 
    cp -R . "$pkgdir/usr/share/doc/zendframework2/api"
}
