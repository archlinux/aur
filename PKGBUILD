# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.15.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.15.0/fw')
sha256sums=('39b95994ce9cd390c3f29875241c23e4f12e50b7ce5d83ab712fbd9bd7e805db')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

