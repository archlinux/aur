# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-bin
_pkgver="4.5.4"
pkgver=${_pkgver/-beta./.}
pkgrel=1
epoch=
pkgdesc="λ eigenwallet (previously UnstoppableSwap) is a GUI for trustless cross-chain XMR<>BTC Atomic Swaps."
arch=('x86_64')
url="https://eigenwallet.org/"
license=('GPL-3.0')
groups=()
depends=(glib2 hicolor-icon-theme gtk3 'webkitgtk-6.0' 'webkit2gtk-4.1')
provides=(unstoppableswap-gui eigenwallet)
conflicts=(unstoppableswap-gui)
backup=()
options=()
optdepends=(
	'eigenwallet-developertools-bin: developer & maker tools for eigenwallet'
)
source=("https://github.com/EigenWallet/core/releases/download/${_pkgver}/eigenwallet_${_pkgver}_amd64.deb")
sha256sums=('3d1ae8f3435195131a0566ba08e37bca9e1843aff0522005a34d378e1d745043')
validpgpkeys=()

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
}
