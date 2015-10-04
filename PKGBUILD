# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=zendframework2-apidoc
pkgver=2.4.8
pkgrel=1
pkgdesc="API Documentation for ZendFramework2"
arch=('any')
url="http://framework.zend.com/"
license=('BSD')
options=(!strip)
source=("http://packages.zendframework.com/releases/ZendFramework-$pkgver/ZendFramework-$pkgver-apidoc.tgz")
ha256sums=('95a3269e7761f6cfa1b7a7642a65ea9e659d7d1e11cfdaf07a4adb249489a6a6')

build() {
    true
}

package() {
    cd "$srcdir/ZendFramework-$pkgver-apidoc"
    install -d "$pkgdir/usr/share/doc/zendframework2/api" 
    cp -R . "$pkgdir/usr/share/doc/zendframework2/api"
}
