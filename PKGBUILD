# Maintainer: LvcasX1 <ilucas.gp7@gmail.com>
pkgname=ithil-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="A Terminal User Interface for Telegram"
arch=('x86_64')
url="https://github.com/lvcasx1/ithil"
license=('MIT')
provides=('ithil')
conflicts=('ithil')
source=("https://github.com/lvcasx1/ithil/releases/download/v${pkgver}/ithil-linux-x86_64.tar.gz")
sha256sums=('7590aea98b0d0c44142ed78f9b44023e8258c67f997d992b35a33c4742fd5fe0')

package() {
  install -Dm755 "${srcdir}/ithil" "${pkgdir}/usr/bin/ithil"
}
