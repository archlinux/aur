# Maintainer: David Roheim <david.roheim@gmail.com>
pkgname=zendframework2-apidoc
pkgver=2.4.9
pkgrel=1
pkgdesc="API Documentation for ZendFramework2"
arch=('any')
url="http://framework.zend.com/"
license=('BSD')
options=(!strip)
source=("http://packages.zendframework.com/releases/ZendFramework-$pkgver/ZendFramework-$pkgver-apidoc.tgz")
sha256sums=('fbab79732cbc94496575d1691006b68ec2559b9b2c06a3515b94192443422aa4')

build() {
    true
}

package() {
    cd "$srcdir/ZendFramework-$pkgver-apidoc"
    install -d "$pkgdir/usr/share/doc/zendframework2/api" 
    cp -R . "$pkgdir/usr/share/doc/zendframework2/api"
}

