# Maintainer: Ersin Can Karaca <canersinkaraca@gmail.com>
pkgname=lapse-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Modern and lightweight game clipper for Linux (Pre-compiled version)"
arch=('x86_64')
url="https://github.com/canersin/Lapse"
license=('GPLv3')
depends=('gtk3' 'gpu-screen-recorder' 'libappindicator-gtk3')
provides=('lapse')
conflicts=('lapse' 'lapse-git')

# Using the .deb package as source is the easiest way for -bin packages
source=("https://github.com/canersin/Lapse/releases/download/v${pkgver}/lapse_${pkgver}-1_amd64.deb")
sha256sums=('SKIP')

package() {
  # Extract the data.tar.xz from the debian package
  tar -xvf data.tar.xz -C "${pkgdir}/"
}
