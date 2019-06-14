# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=2.0.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/2.0.0/fw')
sha256sums=('dae4e88fe1935d53cbedf84c09db3da6201743e89ba7c35fa3d232af8e3ded20')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

