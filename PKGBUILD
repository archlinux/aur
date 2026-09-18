# Maintainer: Akrata
pkgname=kolektivo-icon-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="Icon theme that combines MoreWaita with the Breeze cursor theme and a modified version of the Amy-Plasma-Themes folder theme"
arch=("any")
url="https://github.com/Akr4ta/kolektivo-icon-theme"
license=("GPL3")
depends=('adwaita-icon-theme')
makedepends=(git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Akr4ta/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf70aed406b2965a1f322cfc8cac9d12db9424702cf4349823231d094fabc9ff')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -dm755 "${pkgdir}/usr/share/icons/"
  cp -r kolektivo-nokto "${pkgdir}/usr/share/icons/"
  cp -r kolektivo-blue "${pkgdir}/usr/share/icons/"
}
