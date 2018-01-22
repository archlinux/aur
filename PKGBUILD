# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.7.2
pkgrel=4
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.7.2/fw')
sha256sums=('847c7cb66116eadba3da1ea3a75c5f790ded67f9c0a8267a1d9c45db6f3584f2')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

