# Maintainer: sker <skippiepie@pm.me>
pkgname=sonixy-bin
_pkgname=sonixy
pkgver=0.2.2
pkgrel=1
pkgdesc="Lightweight audio collection manager"
arch=('x86_64')
url="https://codeberg.org/sker/sonixy"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libnm' 'libappindicator-gtk3' 'librsvg')
provides=('sonixy')
conflicts=('sonixy')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('0e56558473c53cf85934b1fb341a45da7a88d4ded53a41c368fa007969d356ca')

package() {
  # Extract the debian data archive
  tar -xvf data.tar.gz -C "$pkgdir/"
}
