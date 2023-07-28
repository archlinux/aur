# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.6
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("$pkgname-v$pkgver::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("$pkgname-v$pkgver::https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('7d41dcad365d67297b73d2cce71934c527f065c726ca248cef5ef060b9a9ab97fcfbc184a48e047032e4bde649d9677495cc95313f61c68a60db8e494c377673')
b2sums_aarch64=('7d41dcad365d67297b73d2cce71934c527f065c726ca248cef5ef060b9a9ab97fcfbc184a48e047032e4bde649d9677495cc95313f61c68a60db8e494c377673')

package() {
  cd "$srcdir"
  install -Dm755 "$pkgname-v$pkgver" "$pkgdir/usr/bin/drtl"
}
