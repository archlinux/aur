# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=unstoppableswap-gui-bin
_pkgver=1.0.0-rc.11
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
source=("https://github.com/UnstoppableSwap/core/releases/download/${_pkgver}/UnstoppableSwap_${_pkgver}_amd64.deb")
sha256sums=('d104ee8f3dbf15a6fe9aac69b338c04e27813a5e768feb52d8b470912075774c')
validpgpkeys=()

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
}
