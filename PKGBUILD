# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=unstoppableswap-gui-bin
_pkgver=2.0.3
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
sha256sums=('dae3ac67a22f6907acf8560643470d625c92ce3c8dc1fff77ea9370c9ccdf962')
validpgpkeys=()

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
}
