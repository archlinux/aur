# Maintainer: Black_Codec <orso.f.regna@gmail.com>

pkgname=jwmappmenugen-git
_pkgname=jwmappmenugen
pkgver=0.1
pkgrel=2
pkgdesc="A simple menu generator for the Joe's Window Manager based on fbmenugen."
arch=('any')
url="https://github.com/BlackCodec/jwmappmenugen/tree/master"
license=('GPL')
depends=('perl>=5.14.0' 'jwm' 'perl-data-dump' 'perl-linux-desktopfiles>=0.08')
source="https://github.com/BlackCodec/jwmappmenugen/archive/master.zip"
md5sums=('0fca326d9daba9c8ed4a43aedd9bb490')

package() {
   install -Dm 755 "$srcdir/$_pkgname-master/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
