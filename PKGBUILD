# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=sswb
pkgver=0.1
pkgrel=1
pkgdesc="Stupid simple Web Browser - a simply gtk webkit browser"
arch=('any')
url="https://github.com/BlackCodec/sswb"
license=('GPL')
depends=('webkitgtk' 'pygtk')
source="https://github.com/BlackCodec/$pkgname/archive/master.zip"
md5sums=('5c7a7d3f50851dbfc91220d94e2d7541')

package() {
   install -Dm 755 "$srcdir/$pkgname-master/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

