# Maintainer: Piano Nekomiya <kotone.olin1010@gmail.com>
# Contributor: Piano Nekomiya <kotone.olin1010@gmail.com>

pkgname=fonts-genei-m-gothic
pkgver=2.0
pkgrel=1
pkgdesc="GenEiMGothic Japanese outline fonts"
arch=('any')
url="https://okoneya.jp/font/genei-m-gothic.html"
license=('custom')
depends=('fontconfig')
source=(https://okoneya.jp/font/GenEiMGothic_v${pkgver}.zip)
sha256sums=('SKIP')

package() {
  cd ${srcdir}/GenEiMGothic_v${pkgver}

  install -d ${pkgdir}/usr/share/fonts/GenEiMGothic
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/GenEiMGothic/

  install -D -m644 OFLicense.txt \
          ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}