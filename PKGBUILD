# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

pkgname=unstoppableswap-gui-bin
_pkgver=3.0.0
pkgver=${_pkgver/-/.}
pkgrel=2
epoch=
pkgdesc="λ eigenallet (previously UnstoppableSwap) is a GUI for trustless cross-chain XMR<>BTC Atomic Swaps."
arch=('x86_64')
url="https://eigenwallet.org/"
license=('GPL-3.0')
groups=()
depends=(glib2 hicolor-icon-theme gtk3 webkit2gtk)
provides=(unstoppableswap-gui)
conflicts=(unstoppableswap-gui)
backup=()
options=()
# Usually _pkgver
pkgrelease=("${_pkgver}-beta")
source=("https://github.com/EigenWallet/core/releases/download/${pkgrelease}/EigenWallet_${pkgrelease}_amd64.deb")
sha256sums=('0eadc67beb0d361c359e18685ffcf6350fda071603c417109b1e6182b683479a')
validpgpkeys=()

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir/"
}
