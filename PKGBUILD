# Maintainer: Sam Whited <sam@samwhited.com>

_fnt_name=dita-sweet
pkgname=ttf-${_fnt_name}
pkgver=1.0.0
pkgrel=1
pkgdesc="An art deco font by Ivan Gladkikh."
arch=('any')
url="http://jovanny.ru/"
license=('custom:OFL')
source=('http://jovanny.ru/files/fonts/dita-sweet.zip')
sha256sums=('13efcff4fb4496f9c52669ac8b8779551b7d51ac0af278fc0102ccf1adced20f')

package() {
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -d ${pkgdir}/usr/share/fonts/OTF
  install -Dm644 ${srcdir}/Dita-Sweet/Dita-Sweet.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -Dm644 ${srcdir}/Dita-Sweet/Dita-Sweet.otf ${pkgdir}/usr/share/fonts/OTF/

	install -Dm644 "${srcdir}/Dita-Sweet/FREE FONT LICENSE.txt" ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
