# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=dovi_tool-bin
pkgver=1.5.3
pkgrel=1
pkgdesc='CLI tool combining multiple utilities for working with Dolby Vision'
arch=('x86_64')
url='https://github.com/quietvoid/dovi_tool'
license=('MIT')
conflicts=('dovi_tool')
provides=('dovi_tool')
source=("https://github.com/quietvoid/dovi_tool/releases/download/$pkgver/dovi_tool-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('b1a2e1e5dd84862b8442bbefbb09f394d76e8c9a036a224c5c6cae3db843f4e5')

package() {
  cd "$srcdir/"

  install -Dm755 dovi_tool "${pkgdir}/usr/bin/dovi_tool"
}
