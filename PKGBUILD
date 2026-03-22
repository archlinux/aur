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
sha256sums=('0c83d78edf66de9338c26d192512500ed1b6788954d2d466188784a5c9964f22')

package() {
  install -Dm755 "${srcdir}/ithil" "${pkgdir}/usr/bin/ithil"
}
