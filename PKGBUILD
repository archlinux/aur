# Maintainer: Japorized <japorized (at) tuta (dot) io>

pkgname=otf-magnolia-script
pkgver=1.0.0
pkgrel=1
pkgdesc="Magnolia Script font from the Free fonts project"
arch=('any')
url="http://jovanny.ru/"
license=('custom:OFL')
source=('http://jovanny.ru/files/fonts/magnolia_script.zip')
sha256sums=('1698f2a4bd60e6eb879d75265c5fb6b80807ae8a64f83839042300e8aa6e2524')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF
  install -Dm644 "${srcdir}/Magnolia_Script/Magnolia Script.otf" ${pkgdir}/usr/share/fonts/OTF/

	install -Dm644 "${srcdir}/Magnolia_Script/FREE FONT LICENSE.txt" ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
