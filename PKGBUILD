# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.9
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('334068f94c6e3ab30875989e15dc57c4560abb3a3b2c75241a4ad2df7f29a02757a112b941dfce6972e35074d0106e9e273e3a7590c390a0e112e5aca1fdafcd')
b2sums_aarch64=('b0990a8e746ddc97abb41e1777a97d6bc2ff70ad39e4a5c5be46bae4ff241563eed591e747e6bdcf0cf40fa5c2da9a1c0e05a8d03ab6924c8a8ef2f0de9b53ff')

package() {
  install -Dm755 "$srcdir/drtl-v$pkgver-$CARCH-linux" "$pkgdir/usr/bin/drtl"
}
