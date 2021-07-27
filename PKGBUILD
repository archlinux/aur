# Maintainer: Piano Nekomiya <kotone.olin1010@gmail.com>
# Contributor: Piano Nekomiya <kotone.olin1010@gmail.com>

pkgname=fonts-aileron
pkgver=0.102
pkgrel=1
pkgdesc="Aileron outline fonts"
arch=('any')
url="https://www.dotcolon.net/font/aileron"
license=('custom')
depends=('fontconfig')
zipver="0102"
source=(https://dotcolon.net/download/fonts/aileron_${zipver}.zip)
sha256sums=('SKIP')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/fonts/Aileron/
  install -m644 *.otf ${pkgdir}/usr/share/fonts/Aileron/

  curl https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt -o CC0.txt
  install -D -m644 CC0.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}