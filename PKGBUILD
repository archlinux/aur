# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.5.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/v2.5.0/fw')
sha256sums=('99381cfce158d147d0fea6f45b327796f0289618aa43e129dee6d8ea25f780b1')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

