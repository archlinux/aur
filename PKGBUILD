# Maintainer: LvcasX1 <ilucas.gp7@gmail.com>
pkgname=ithil-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A Terminal User Interface for Telegram"
arch=('x86_64')
url="https://github.com/lvcasx1/ithil"
license=('MIT')
provides=('ithil')
conflicts=('ithil')
source=("https://github.com/lvcasx1/ithil/releases/download/v${pkgver}/ithil-linux-x86_64.tar.gz")
sha256sums=('eb8ca0b0e9b930186e92e3ea901d81d9bc2c3ab279cc6340f71f2c0fe439d6ef')

package() {
  install -Dm755 "${srcdir}/ithil" "${pkgdir}/usr/bin/ithil"
}
