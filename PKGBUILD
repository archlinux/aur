# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-daemon
pkgver=1.3.0
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('glibc')
source=("https://github.com/NebulousLabs/Sia/releases/download/${_pkgver}/Sia-${_pkgver}-linux-amd64.zip")
sha256sums=('51e6f414d0d3152b1a6119b02ad24fb6979f0bed4fc225126d67a5a7661f30b6')

package() {
  cd $srcdir/Sia-$_pkgver-linux-amd64

  install -Dm755 siac "${pkgdir}/usr/bin/siac"
  install -Dm755 siad "${pkgdir}/usr/bin/siad"
}
