# Maintainer: LvcasX1 <ilucas.gp7@gmail.com>
pkgname=ithil-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="A Terminal User Interface for Telegram"
arch=('x86_64')
url="https://github.com/lvcasx1/ithil"
license=('MIT')
provides=('ithil')
conflicts=('ithil')
source=("https://github.com/lvcasx1/ithil/releases/download/v${pkgver}/ithil-linux-x86_64.tar.gz")
sha256sums=('ef494be32895e5b2d957366b2a8e091fe95c1f64465895dbd502bf3f00b781fd')

package() {
  install -Dm755 "${srcdir}/ithil" "${pkgdir}/usr/bin/ithil"
}
