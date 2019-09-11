# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.2.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/v2.2.0/fw')
sha256sums=('dcac6ea97df9988b37640b634e874096d72c1eda5833aab575f004021626d2d3')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

