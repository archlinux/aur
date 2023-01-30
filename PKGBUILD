# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=dovi_tool-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='CLI tool combining multiple utilities for working with Dolby Vision'
arch=('x86_64')
url='https://github.com/quietvoid/dovi_tool'
license=('MIT')
conflicts=('dovi_tool')
provides=('dovi_tool')
source=("https://github.com/quietvoid/dovi_tool/releases/download/$pkgver/dovi_tool-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('f05ce02557c4c0a044fd375f4bc88c85f0ef4a4f4388fcf4afc2af12138005e8')

package() {
  cd "$srcdir/"

  install -Dm755 dovi_tool "${pkgdir}/usr/bin/dovi_tool"
}
