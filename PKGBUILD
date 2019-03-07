# Maintainer: Your name <bros at brocode dot sh>

pkgname=fw
pkgver=1.20.0
pkgrel=1
pkgdesc="faster workspace management"
depends=('fzf')
arch=('x86_64')
url="https://github.com/brocode/fw"
license=('WTFPL')
source=('https://github.com/brocode/fw/releases/download/1.20.0/fw')
sha256sums=('57f17adf68e7698ff35c9da4d64ebfc86cef3dcefa62f85fa157db509768dd2b')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x fw
  cp fw "${pkgdir}/usr/bin/fw"
}

