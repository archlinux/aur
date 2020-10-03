# Maintainer: KokaKiwi <kokakiwi plus aur at kokakiwi dot net>
# Contributor: Jordi Pakey-Rodriguez <jordi at 0xdec dot im>

pkgname=ttf-material-design-icons
pkgver=4.0.0
pkgrel=1
pkgdesc="Material Design icons by Google"
arch=('any')
url="http://google.github.io/material-design-icons/"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/material-design-icons/archive/${pkgver}.tar.gz")
sha256sums=('b1b068d625d5e15d6ec0059209cec67bc4c46e39c4611b859d6f6680dbf23934')
b2sums=('be09f9470cea698e12b10882054813cffbfc228c823d8a32e35d9b0125f76e7543b0980e239659317f0a4c343d1f9426c215f82a6b28d4d9b9ead80f8e3ad3d7')

package() {
  cd "material-design-icons-${pkgver}"

  install -Dm0644 "font/MaterialIcons-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF/MaterialIcons-Regular.ttf"
  install -Dm0655 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
