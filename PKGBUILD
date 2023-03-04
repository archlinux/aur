# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=dovi_tool-bin
pkgver=2.0.3
pkgrel=1
pkgdesc='CLI tool combining multiple utilities for working with Dolby Vision'
arch=('x86_64')
url='https://github.com/quietvoid/dovi_tool'
license=('MIT')
conflicts=('dovi_tool')
provides=('dovi_tool')
source=("https://github.com/quietvoid/dovi_tool/releases/download/$pkgver/dovi_tool-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('147c43704bb3464c1bc485190a94f9912ef95de6277ff17d4ff25188aae4ac7a')

package() {
  cd "$srcdir/"

  install -Dm755 dovi_tool "${pkgdir}/usr/bin/dovi_tool"
}
