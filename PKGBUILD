# Maintainer: sker <skippiepie@pm.me>
pkgname=sonixy-bin
_pkgname=sonixy
pkgver=0.2.1
pkgrel=1
pkgdesc="Lightweight audio collection manager"
arch=('x86_64')
url="https://codeberg.org/sker/sonixy"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libnm' 'libappindicator-gtk3' 'librsvg', 'webkit2gtk-4.1')
provides=('sonixy')
conflicts=('sonixy')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('a70cc27a0ba35d43d49f92b80e302ea1732ac7e6426bd9a1afcf0a6fd9e18905')

package() {
  # Extract the debian data archive
  tar -xvf data.tar.gz -C "$pkgdir/"
}
