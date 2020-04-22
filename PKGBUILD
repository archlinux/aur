# Maintainer: Gregory <gregory.mkv@gmail.com>

pkgname=passbox
pkgver=1.0.0
pkgrel=1
pkgdesc="A password manager for your code"
arch=('x86_64')
url="https://passbox.app"
license=('unknown')
source=("https://passbox.app/download/bin/passbox-linux")
sha256sums=('SKIP')

package() {
  mv passbox-linux passbox
  install -dm 755 "${pkgdir}/usr/bin"
  install -m 755 passbox -t "${pkgdir}/usr/bin"
}
