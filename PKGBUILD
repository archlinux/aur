# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-bin
_pkgver="3.6.1"
pkgver=${_pkgver/-beta./.}
pkgrel=1
epoch=
pkgdesc="λ eigenwallet (previously UnstoppableSwap) is a GUI for trustless cross-chain XMR<>BTC Atomic Swaps."
arch=('x86_64')
url="https://eigenwallet.org/"
license=('GPL-3.0')
groups=()
depends=(glib2 hicolor-icon-theme gtk3 webkit2gtk 'webkit2gtk-4.1')
provides=(unstoppableswap-gui eigenwallet)
conflicts=(unstoppableswap-gui)
backup=()
options=()
optdepends=(
	'eigenwallet-developertools-bin: developer & maker tools for eigenwallet'
)
source=("https://github.com/EigenWallet/core/releases/download/${_pkgver}/eigenwallet_${_pkgver}_amd64.deb")
sha256sums=('2f424d29b8ab9d949534d844cd2a70ab926cb5fa52192a3913cdf39b1a0eb975')
validpgpkeys=()

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
}
