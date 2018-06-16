# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-daemon
pkgver=1.3.3
_pkgver="v${pkgver}"
pkgrel=2
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('glibc')
source=("https://github.com/NebulousLabs/Sia/releases/download/${_pkgver}/Sia-${_pkgver}-linux-amd64.zip")
sha256sums=('d76bed3fce0bd01591b6bf7ead12369d3701efdc8b98103f0f0d4c71284136b2')

package() {
  cd $srcdir/Sia-$_pkgver-linux-amd64

  install -Dm755 siac "${pkgdir}/usr/bin/siac"
  install -Dm755 siad "${pkgdir}/usr/bin/siad"
}
