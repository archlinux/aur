# Maintainer: Piano Nekomiya <kotone.olin1010@gmail.com>
# Contributor: Piano Nekomiya <kotone.olin1010@gmail.com>

pkgname=fonts-vegur
pkgver=0.701
pkgrel=1
pkgdesc="Vegur outline fonts"
arch=('any')
url="https://www.dotcolon.net/font/vegur"
license=('custom')
depends=('fontconfig')
zipver="0701"
source=(https://dotcolon.net/download/fonts/vegur_${zipver}.zip)
sha256sums=('SKIP')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/fonts/Vegur/
  install -m644 *.otf ${pkgdir}/usr/share/fonts/Vegur/

  curl https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt -o CC0.txt
  install -D -m644 CC0.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}