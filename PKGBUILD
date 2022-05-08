# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=sswb-git
_pkgname=sswb
pkgver=0.1
pkgrel=2
pkgdesc="Stupid simple Web Browser - a simply gtk webkit browser"
arch=('any')
url="https://github.com/BlackCodec/sswb"
license=('GPL')
depends=('webkit2gtk' 'python-gobject')
source=("https://github.com/BlackCodec/$pkgname/archive/master.zip")
md5sums=('SKIP')

package() {
   install -Dm 755 "$srcdir/$_pkgname-master/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

