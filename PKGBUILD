# Maintainer: Piano Nekomiya <kotone.olin1010@gmail.com>
# Contributor: Piano Nekomiya <kotone.olin1010@gmail.com>

pkgname=otf-shippori-mincho
pkgver=3.000
pkgrel=1
zipver="3"
pkgdesc="Shippori Mincho Japanese outline fonts"
arch=('any')
url="https://fontdasu.com/shippori-mincho/"
license=('custom')
depends=('fontconfig')
source=(https://fontdasu.com/download/shippori${zipver}.zip)
sha256sums=('SKIP')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/fonts/ShipporiMincho
  install -m644 *.otf ${pkgdir}/usr/share/fonts/ShipporiMincho/

  install -D -m644 OFL.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}