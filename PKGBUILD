# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=otf-vollkorn
pkgdesc="Vollkorn typeface by Friedrich Althausen (OpenType)"
url='http://vollkorn-typeface.com/'
license=('OFL')
pkgver=4.105
pkgrel=2
changelog=ChangeLog.${pkgname}
arch=('any')

source=(http://vollkorn-typeface.com/download/vollkorn-${pkgver//./-}.zip)
sha256sums=('e650ea9d967c2af1e9b8d34e1118721728bcd73ccfd3220da4264661301e8af5')

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 "${srcdir}/PS-OTF/"*.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -D -m644 "${srcdir}/OFL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
  install -D -m644 "${srcdir}/Fontlog.txt" "${pkgdir}/usr/share/doc/${pkgname}/Fontlog.txt"
}
