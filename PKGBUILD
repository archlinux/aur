
# Maintainer: Your Name h_cheung@outlook.com
pkgname=go-tun2socks
pkgver=1.16.7
pkgrel=1
epoch=
pkgdesc="A tun2socks implementation written in Go."
arch=('x86_64')
url="https://github.com/eycorsican/go-tun2socks/"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=('go-tun2socks' 'tun2socks')
conflicts=('go-tun2socks' 'tun2socks')
replaces=()
backup=()
options=()
install=
changelog=
source=("tun2socks::https://github.com/eycorsican/go-tun2socks/releases/download/v${pkgver}/tun2socks-linux-amd64")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
  mkdir -p ${pkgdir}/usr/bin
  install -m=775 "tun2socks" "${pkgdir}/usr/bin"
}
