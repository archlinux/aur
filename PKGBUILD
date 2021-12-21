# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

_pkgname=lynx-bootstrap
pkgname=${_pkgname,}
pkgver=5.1.3
pkgrel=1
pkgdesc="Lynx Bootstrap - Bootstrap para LynxOS"
url="https://gitlab.com/LynxOS/$pkgname"
license=('GPL')
arch=('any')
md5sums=('b9e3d530b140de4017e031e510d3fd87')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")

package() {
    cd $pkgname-$pkgver
    install -dm755 $pkgdir/usr/share/Lynx/$pkgname/
    cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/Lynx/$pkgname/
}
