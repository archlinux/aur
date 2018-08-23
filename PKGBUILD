# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.10.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.10.0/fw')
sha256sums=('5e9d486f56c5024cf17b9b979ba4d28d5fd2cd65ab1f05f24cb7ec9fe817468a')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

