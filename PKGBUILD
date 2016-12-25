# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=stardict-arramooz
pkgver=0.1
pkgrel=1
pkgdesc="Arramooz Alwaseet: Arabic Dictionary for Morphological analysis"
license=('GPL2')
arch=('any')
depends=('stardict')
url="https://github.com/linuxscout/arramooz"
sha256sums=('8d25173a31bfe48d1ae13ab4f5277db1293742a92937f50be870d5723f02bf2f')
source=(http://downloads.sourceforge.net/project/arramooz/arramooz-stardict.${pkgver}.zip)

package() {
  #cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/share/stardict/dic/"
  install -Dm644 arramooz.dict.dz arramooz.idx arramooz.ifo arramooz.syn "$pkgdir/usr/share/stardict/dic/"

  install -d $pkgdir/usr/share/doc/$pkgname
  install -m644 AUTHORS.md README.md "$pkgdir/usr/share/doc/$pkgname/"

}
