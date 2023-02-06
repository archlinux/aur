# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=dovi_tool-bin
pkgver=2.0.1
pkgrel=1
pkgdesc='CLI tool combining multiple utilities for working with Dolby Vision'
arch=('x86_64')
url='https://github.com/quietvoid/dovi_tool'
license=('MIT')
conflicts=('dovi_tool')
provides=('dovi_tool')
source=("https://github.com/quietvoid/dovi_tool/releases/download/$pkgver/dovi_tool-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('c66d8ae9910b58f18271d067720b18f44a41b19684d69b3a1f2539f45f69c097')

package() {
  cd "$srcdir/"

  install -Dm755 dovi_tool "${pkgdir}/usr/bin/dovi_tool"
}
