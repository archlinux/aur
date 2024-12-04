# Maintainer: Hikari <xec[at]domain:tuta.io>
pkgname=bitbox-wallet-app-rpm
pkgver=4.46.3
_pkgver=4.46.3-1
pkgrel=1
pkgdesc="BitBox Wallet App for managing digital assets"
arch=('x86_64')
url="https://bitbox.swiss/"
license=('Apache License 2.0')
depends=('bitbox-udev') 
makedepends=('libarchive' 'curl')
source=("https://github.com/BitBoxSwiss/bitbox-wallet-app/releases/download/v${pkgver}/bitbox-${_pkgver}.x86_64.rpm")
sha256sums=('4f2417af95808d947498955ad88e1939c329bc340b428457fa5c5da5d1472a46')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"
  bsdtar -xf "bitbox-${_pkgver}.x86_64.rpm" --directory="$pkgdir" --strip-components=1
}
