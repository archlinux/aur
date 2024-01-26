# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.15
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('462ad234f46c33cfa12dcb009451e371b7a587dde67a865e4506400a4a92019594fc64c6e36209f37fa18017165a6ef3decd05eb9375d09f9f52656c170f9245')
b2sums_aarch64=('58f48056559b9dacb5dac5da425fbe59b0d212a4bb4e06639966537ff3dab7d0cc1e94fc1f792498b3c547ccd41b173cb2ad47b7990a148b700410367f8723ce')

package() {
  install -Dm755 "$srcdir/drtl-v$pkgver-$CARCH-linux" "$pkgdir/usr/bin/drtl"
}
