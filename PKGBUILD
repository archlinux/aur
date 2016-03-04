# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=sswb
pkgver=0.1
pkgrel=2
pkgdesc="Stupid simple Web Browser - a simply gtk webkit browser"
arch=('any')
url="https://github.com/BlackCodec/sswb"
license=('GPL')
depends=('webkitgtk' 'pygtk')
source=("https://github.com/BlackCodec/$pkgname/archive/master.zip")
md5sums=('01f7f7ad92ddc6b1ccf1f03e5c662c0a')

package() {
   install -Dm 755 "$srcdir/$pkgname-master/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

