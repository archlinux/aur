# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-daemon
pkgver=1.3.4
_pkgver="v${pkgver}"
_hash="8b940c81f06a62933ba00dd58ebd741b"
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('glibc')
source=("https://gitlab.com/NebulousLabs/Sia/uploads/${_hash}/Sia-${_pkgver}-linux-amd64.zip")
sha256sums=('b8d189e874cc5a1cafb5a59116b5122f614fe60bd7575abc5b53fc7259c870ed')

package() {
  cd $srcdir/Sia-$_pkgver-linux-amd64

  install -Dm755 siac "${pkgdir}/usr/bin/siac"
  install -Dm755 siad "${pkgdir}/usr/bin/siad"
}
