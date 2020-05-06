# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.4.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/v2.4.0/fw')
sha256sums=('4878d4c8b82e50f6af341a705974a6cdacb98c44e7aa7b8717e6f5c48f05e475')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

