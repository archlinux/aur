# Maintainer: Ev1lbl0w <ricasubtil at gmail dot com>

pkgname=fortune-mod-billwurtz
pkgver=1.0
pkgrel=1
pkgdesc="A collection of quotes from bill wurtz for usage with fortune, i guess..."
url="https://github.com/Ev1lbl0w/fortune-mod-billwurtz"
arch=("any")
license=("GPL3")
depends=("fortune-mod")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Ev1lbl0w/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("47cecae76af550eae05bda776fa273bb85904db3ab83efa72283edbb47af2e10")

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m644 billwurtz $pkgdir/usr/share/fortune/billwurtz
  install -D -m644 billwurtz.dat $pkgdir/usr/share/fortune/billwurtz.dat
}
