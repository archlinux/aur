# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=eigenwallet-bin
_pkgver=3.0.0
pkgver=${_pkgver/-/.}
pkgrel=6
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
# Usually _pkgver
pkgrelease=("${_pkgver}-beta.4")
source=("https://github.com/EigenWallet/core/releases/download/${pkgrelease}/EigenWallet_${pkgrelease}_amd64.deb")
sha256sums=('89c8943374b07448e967c6dceb8e471a473b889057a9a793b067fd71e7cd0f95')
validpgpkeys=()

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
}
