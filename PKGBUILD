# Maintainer: Alexandru Bocioacă (robocioaca) <arch-aur.20.telemea@spamgourmet.com>

pkgname=otf-sweden-sans
pkgver=1
pkgrel=4
pkgdesc="Sweden Sans typeface is the key element in the Sweden Brand Identity. It works to maintain consistency, create clarity, and handle the Sweden brand legacy."
arch=('any')
url="https://identity.sweden.se/en/design-elements/typography"
license=('custom')
depends=(fontconfig xorg-mkfontscale)
install=otf-sweden-sans.install
source=(https://identity.sweden.se/userfiles/19863.zip)
sha256sums=('216ebf9f71e13917896432c237d4eedb856c0dfd390dfe614c542819f6f1fc81')

package() {
  cd "${srcdir}/Sweden-Sans/Desktop"

  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
}
