# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=dovi_tool-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='CLI tool combining multiple utilities for working with Dolby Vision'
arch=('x86_64')
url='https://github.com/quietvoid/dovi_tool'
license=('MIT')
conflicts=('dovi_tool')
provides=('dovi_tool')
source=("https://github.com/quietvoid/dovi_tool/releases/download/$pkgver/dovi_tool-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('4e4400941dca3026ab24596643424b50adcb678412335e72c1f7154d2f0b0cf6')

package() {
  cd "$srcdir/"

  install -Dm755 dovi_tool "${pkgdir}/usr/bin/dovi_tool"
}
