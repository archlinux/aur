# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.7
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("$pkgname-v$pkgver::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("$pkgname-v$pkgver::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('a888bf90597249b8d3ac40a761e00e5de441d80467120e4b4beda87597d15b497616e011d2f3eeb78183ead7f41a640ee76204a153b8aa78b0f69566977363bd')
b2sums_aarch64=('a888bf90597249b8d3ac40a761e00e5de441d80467120e4b4beda87597d15b497616e011d2f3eeb78183ead7f41a640ee76204a153b8aa78b0f69566977363bd')

package() {
  cd "$srcdir"
  install -Dm755 "$pkgname-v$pkgver" "$pkgdir/usr/bin/drtl"
}
