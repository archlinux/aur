# Maintainer: Joaquin (Pato) Decima <https://patojad.com.ar/>

_pkgname=lynx-base-css
pkgname=${_pkgname,}
pkgver=0.0.1
pkgrel=1
pkgdesc="Lynx CSS Base - CSS Base para Lynx"
url="https://gitlab.com/LynxOS/$pkgname"
license=('GPL')
arch=('any')
md5sums=('8518e2efdb8fa8aafea9aed90c8f200e')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")

package() {
    cd $pkgname-$pkgver
    install -dm755 $pkgdir/usr/share/Lynx/$pkgname/
    cp -r $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/Lynx/$pkgname/
}
