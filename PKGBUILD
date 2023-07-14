# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.5
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("$pkgname-v$pkgver::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("$pkgname-v$pkgver::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('ad4fe20eaf2ab7e780968229204ad6555049780c0bf1e2be685ebe14de1fffcb0854a265eaac4eab35bc584f52bae940cd7ed3e2ff0816d2ec930eb7e27b6288')
b2sums_aarch64=('ad4fe20eaf2ab7e780968229204ad6555049780c0bf1e2be685ebe14de1fffcb0854a265eaac4eab35bc584f52bae940cd7ed3e2ff0816d2ec930eb7e27b6288')

package() {
  cd "$srcdir"
  install -Dm755 "$pkgname-v$pkgver" "$pkgdir/usr/bin/drtl"
}
