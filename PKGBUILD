# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.4
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("$pkgname-v$pkgver::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("$pkgname-v$pkgver::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('e585bbf04c82f21e78d384197d5234b8a89007f2293292362380f22bfb3cce15bf4c3088e8f52fae6737fa6aae9c74d60b7c679508120d4d74dd3c8ec251e277')
b2sums_aarch64=('e585bbf04c82f21e78d384197d5234b8a89007f2293292362380f22bfb3cce15bf4c3088e8f52fae6737fa6aae9c74d60b7c679508120d4d74dd3c8ec251e277')

package() {
  cd "$srcdir"
  install -Dm755 "$pkgname-v$pkgver" "$pkgdir/usr/bin/drtl"
}
