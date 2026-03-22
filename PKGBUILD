# Maintainer: LvcasX1 <ilucas.gp7@gmail.com>
pkgname=ithil-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="A Terminal User Interface for Telegram"
arch=('x86_64')
url="https://github.com/lvcasx1/ithil"
license=('MIT')
provides=('ithil')
conflicts=('ithil')
source=("https://github.com/lvcasx1/ithil/releases/download/v${pkgver}/ithil-linux-x86_64.tar.gz")
sha256sums=('a0487d850e40474b12cdece24de1efa5ac7df5c836a667c4b42ca5b9013c22a6')

package() {
  install -Dm755 "${srcdir}/ithil" "${pkgdir}/usr/bin/ithil"
}
