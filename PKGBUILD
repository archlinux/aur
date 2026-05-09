# Maintainer: DasCanard
pkgname=radioss
pkgver=v0.9.1
pkgrel=1
pkgdesc="A modern, cross-platform internet radio player built with Electron, React, and TypeScript"
arch=('x86_64')
url="https://github.com/DasCanard/radioss"
license=('MIT')
depends=('gtk3' 'nss' 'libxss')
source=("radioss-${pkgver}.deb::https://github.com/DasCanard/radioss/releases/download/v0.9.1/radioss_0.9.1_amd64.deb")
sha256sums=('320cde6953cf522c601021c8749e7108a7714ff8ad067480e77a0f3841452384')

package() {
  # Extract .deb package
  ar x "${srcdir}/radioss-${pkgver}.deb"
  tar -xf data.tar.*
  
  # Install files
  cp -r usr/* "${pkgdir}/"
}
