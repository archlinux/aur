pkgname=bun-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Incredibly fast JavaScript runtime, bundler, transpiler and package manager – all in one."
arch=('x86_64')
url="https://github.com/Jarred-Sumner/bun"
license=('MIT')
provides=("bun=$pkgver" 'bun')
source=("https://github.com/Jarred-Sumner/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip")
sha512sums=('a6482277b7db4df29cbab6c6642f7a739d7549f7b55c353deae995a22944dd1ee42dca5db00f999aa4f1b1d56e6ec5878ec558959ab3b7ded04cc74f845a4c55')


package() {
  install -Dm755 "./bun-linux-x64/bun" "${pkgdir}/usr/bin/bun"
}
