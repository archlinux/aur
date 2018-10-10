# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.11.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.11.0/fw')
sha256sums=('86631a499d6323cce59cd24d1e0eb904c05f2115e54b4057c2564862dffdb670')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

