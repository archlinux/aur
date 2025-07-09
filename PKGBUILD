# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=unstoppableswap-gui-bin
_pkgver=2.4.3
pkgver=${_pkgver/-/.}
pkgrel=1
epoch=
pkgdesc="Graphical User Interface for trustless cross-chain XMR<>BTC Atomic Swaps."
arch=('x86_64')
url="https://unstoppableswap.net/"
license=('GPL-3.0')
groups=()
depends=(glib2 hicolor-icon-theme gtk3 webkit2gtk)
provides=(unstoppableswap-gui)
conflicts=(unstoppableswap-gui)
backup=()
options=()
# Usually _pkgver
pkgrelease=("preview")
source=("https://github.com/UnstoppableSwap/core/releases/download/${pkgrelease}/UnstoppableSwap_${_pkgver}_amd64.deb")
sha256sums=('47af0486bfa61cea10f58fd8c4fcf049ea68c9c484f60d0d34ac46f7fa63ee2d')
validpgpkeys=()

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
}
