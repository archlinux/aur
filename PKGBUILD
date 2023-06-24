# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.2
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("drtl::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("drtl::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('bcb4bdbe4eca5dd27f55c9a18ad5fa37141482e0aa900265ba4490c6309b6ab09f36ef9bdabd661fb69467dca0ee9be49787e89b213a8d5c5bacf3dae6983e58')
b2sums_aarch64=('bcb4bdbe4eca5dd27f55c9a18ad5fa37141482e0aa900265ba4490c6309b6ab09f36ef9bdabd661fb69467dca0ee9be49787e89b213a8d5c5bacf3dae6983e58')

package() {
  cd "$srcdir"
  install -Dm755 drtl "$pkgdir/usr/bin/drtl"
}
