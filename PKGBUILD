# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
#
pkgname=drtl-bin
pkgver=0.0.16
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('c87a9cda4b80f1582a58888945e957054fad3b81afab8475de75f9dc49271cca85a118f2fd7be66220cdc938aab2f0110ba77cc72f0e14cea0337df812608dc9')
b2sums_aarch64=('928b5c124e450a164df1953ef69c77a8e75f189dcb7f0780f81d6df5f711deb8282da2981e578257fdce7575251b9ceb691eee8c75089041d07d69f9161b493c')

package() {
  install -Dm755 "$srcdir/drtl-v$pkgver-$CARCH-linux" "$pkgdir/usr/bin/drtl"
}
