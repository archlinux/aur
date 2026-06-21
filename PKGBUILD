# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-bin
_pkgver="4.10.1"
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
sha256sums=('21ea51cc6e9335eb3a4067c564ed260c111a3c1ef983eeb81c363afbb591eaac')
validpgpkeys=()

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
}
