# Maintainer: yuhr <sdn.pate(at)gmail.com>

pkgname=otf-marta
pkgver=1.000
pkgrel=1
pkgdesc="Eclectic, accidental-text font with wedge serifs."
url="https://www.behance.net/gallery/7434601/Marta-Free-Font"
license=('custom:OFL')
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=(marta.zip::http://db.tt/QaawOrVj)
md5sums=('8be36d86e6d5ae692341deba40dd4cbe')

package() {
  cd ${srcdir}
  install -dm755 "${pkgdir}"/usr/share/fonts/OTF
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/OTF/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 *.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
