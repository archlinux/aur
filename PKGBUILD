# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-daemon
pkgver=1.3.1
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('glibc')
source=("https://github.com/NebulousLabs/Sia/releases/download/${_pkgver}/Sia-${_pkgver}-linux-amd64.zip")
sha256sums=('4ef0b8b4fe245b5d836c863e0cd4bf07c8c581b41bbb2a889fefba4c341c780e')

package() {
  cd $srcdir/Sia-$_pkgver-linux-amd64

  install -Dm755 siac "${pkgdir}/usr/bin/siac"
  install -Dm755 siad "${pkgdir}/usr/bin/siad"
}
