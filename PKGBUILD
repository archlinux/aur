# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=menugenerator
_pkgname=MenuGenerator
pkgver=0.4
pkgrel=2
pkgdesc="A simple menu generator for fluxbox openbox jwm that uses xdg-menu."
arch=('any')
url="https://github.com/BlackCodec/MenuGenerator/tree/master"
license=('GPL')
depends=('python-xdg')
source="https://github.com/BlackCodec/MenuGenerator/archive/$pkgver.zip"
md5sums=('47e800507b991de91bfc1acc3541a40b')

package() {
   install -Dm 755 "$srcdir/$_pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

