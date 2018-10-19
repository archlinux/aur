# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.12.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.12.0/fw')
sha256sums=('f7c7ea8ba08f0d8cd23e673113b0d4ee2a3e3bcf65753b859e4db4b1f0ef4f2f')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

