# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.1
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("drtl::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("drtl::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('19083dd1d6a14bec81135eb3a7928032b33a10f924ffa766e39b476c77e346052c67ec072f1b1ae8fc930f6b8f58bdea9e1cee2709564e5c7b624135b1eed0e5')
b2sums_aarch64=('19083dd1d6a14bec81135eb3a7928032b33a10f924ffa766e39b476c77e346052c67ec072f1b1ae8fc930f6b8f58bdea9e1cee2709564e5c7b624135b1eed0e5')

package() {
  cd "$srcdir"
  install -Dm755 drtl "$pkgdir/usr/bin/drtl"
}
