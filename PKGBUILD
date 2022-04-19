# Maintainer: Jack Polk <decaby7e@ranvier.net>
pkgname="arpchat-bin"
pkgver="1.0.0"
pkgrel="2"
pkgdesc="Answering the question nobody asked: what if you wanted to text your friends using only ARP?"
arch=("x86_64")
url="https://github.com/kognise/arpchat"
license=("custom:THE MONSTERWARE LICENSE")
source=("https://github.com/kognise/arpchat/releases/download/v$pkgver/arpchat-linux")
md5sums=("3a7d93e2541c917d86d5cdc362c23b7d")
install=${pkgname}.install
provides=('arpchat')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/arpchat-linux" "${pkgdir}/usr/bin/arpchat"
  chmod +x "${pkgdir}/usr/bin/arpchat"
}
