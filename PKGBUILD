# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.6.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/v2.6.0/fw')
sha256sums=('12a23dda4fe36a6ec39b34d9570b09f32c43e2bcc96c4730f756f5c5aff402af')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

