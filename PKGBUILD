# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-daemon
pkgver=1.3.2
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('glibc')
source=("https://github.com/NebulousLabs/Sia/releases/download/${_pkgver}/Sia-${_pkgver}-linux-amd64.zip")
sha256sums=('79f0eb4ce8c782cd926ff45db974fd1b88a0f702622c632bc626f4b90ee1651b')

package() {
  cd $srcdir/Sia-$_pkgver-linux-amd64

  install -Dm755 siac "${pkgdir}/usr/bin/siac"
  install -Dm755 siad "${pkgdir}/usr/bin/siad"
}
