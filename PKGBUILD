# Maintainer: DasCanard
pkgname=radioss
pkgver=0.9.3
pkgrel=1
pkgdesc="A modern, cross-platform internet radio player built with Electron, React, and TypeScript"
arch=('x86_64')
url="https://github.com/DasCanard/radioss"
license=('MIT')
depends=('gtk3' 'nss' 'libxss')
source=("radioss-${pkgver}.deb::https://github.com/DasCanard/radioss/releases/download/0.9.3/radioss_0.9.3_amd64.deb")
sha256sums=('f153cabdc282cb55c06b4f455847f88d4603ee8f13536f79bb2e861fb7ec6128')

package() {
  # Extract .deb package
  ar x "${srcdir}/radioss-${pkgver}.deb"
  tar -xf data.tar.*
  
  # Install files
  cp -r usr/* "${pkgdir}/"
}
