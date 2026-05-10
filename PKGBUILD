# Maintainer: DasCanard
pkgname=radioss
pkgver=0.9.2
pkgrel=1
pkgdesc="A modern, cross-platform internet radio player built with Electron, React, and TypeScript"
arch=('x86_64')
url="https://github.com/DasCanard/radioss"
license=('MIT')
depends=('gtk3' 'nss' 'libxss')
source=("radioss-${pkgver}.deb::https://github.com/DasCanard/radioss/releases/download/0.9.2/radioss_0.9.2_amd64.deb")
sha256sums=('a438010e347ecf26c16ea715bb59f2d85f713ff69ca0eb5cd4cf7dd4eaf5539c')

package() {
  # Extract .deb package
  ar x "${srcdir}/radioss-${pkgver}.deb"
  tar -xf data.tar.*
  
  # Install files
  cp -r usr/* "${pkgdir}/"
}
