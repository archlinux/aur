# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=sia-daemon
pkgver=v1.2.2
pkgrel=1
pkgdesc="Blockchain-based marketplace for file storage"
arch=('x86_64')
url="https://sia.tech"
license=('MIT')
depends=('glibc')
source=("https://github.com/NebulousLabs/Sia/releases/download/${pkgver}/Sia-${pkgver}-linux-amd64.zip")
sha256sums=('b11e4535510b3affe0820059226507d68463ddc8cf2c5f59fbe2ff9f8931055c')

package() {
  cd $srcdir/Sia-$pkgver-linux-amd64

  install -Dm755 siac "${pkgdir}/usr/bin/siac"
  install -Dm755 siad "${pkgdir}/usr/bin/siad"
}
