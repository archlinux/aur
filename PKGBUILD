# Maintainer: Alexandru Bocioacă (robocioaca) <arch-aur.20.telemea@spamgourmet.com>

pkgname=otf-sweden-sans
pkgver=1
pkgrel=1
pkgdesc="Sweden Sans is a sans serif typeface that can be used in both analogue and digital formats"
arch=('any')
url="http://sweden.identitytool.com/buildingblocks/secondary-building-blocks-always-use#our-main-typeface"
license=('custom')
depends=(fontconfig xorg-font-utils)
install=otf-sweden-sans.install
source=(http://sweden.identitytool.com/wp-content/uploads/sites/5/sweden_sans_desktop_and_web.zip)
sha256sums=('0a81641bb2de57f332663faf70ed533206948e60ebdb3f636722ff013385198f')

package() {
  cd "${srcdir}/sweden_sans_desktop_and_web"

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
}
