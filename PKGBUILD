# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=myexit
pkgver=0.1
_pkgver=r01
pkgrel=2
pkgdesc="Simple zenity exit dialog"
arch=('any')
url="https://github.com/BlackCodec/myexit/"
license=('GPL3')
depends=('zenity')
source=("https://github.com/BlackCodec/$pkgname/archive/$_pkgver.zip")
md5sums=('c6b4715351ad64c6f2e27017fec809e4')

package() {
   install -Dm 755 "$srcdir/$pkgname-$_pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
