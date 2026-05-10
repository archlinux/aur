# Maintainer: DasCanard
pkgname=radioss
pkgver=0.9.5
pkgrel=1
pkgdesc="A modern, cross-platform internet radio player built with Electron, React, and TypeScript"
arch=('x86_64')
url="https://github.com/DasCanard/radioss"
license=('MIT')
depends=('gtk3' 'nss' 'libxss')
source=("radioss-${pkgver}.deb::https://github.com/DasCanard/radioss/releases/download/0.9.5/radioss_0.9.5_amd64.deb")
sha256sums=('a122c392f5efb66a02a0f2bf93a82f9a1541f206b556b1e8b158cbee2f4211b3')

package() {
  # Extract .deb package
  ar x "${srcdir}/radioss-${pkgver}.deb"
  tar -xf data.tar.*
  
  # Install files
  cp -r usr/* "${pkgdir}/"
}
