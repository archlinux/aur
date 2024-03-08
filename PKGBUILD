# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
#
pkgname=drtl-bin
pkgver=0.0.17
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('add14bbcacc575d520eded0945b204719a165d8005f46f13e3c4aea04a4122b3d6d41524d15ebd1ccfbd75780dde6db5c6c216f1532ee18d5f360b1b993a0c3a')
b2sums_aarch64=('57b41fa0fc880c2da0c40587513ad190188c729f0884d1b8b70c92bccfb34e167a3b5493509eca3d86bd46225e1a3b096c4a9ebc2b3c2d9f980deb1505016fca')

package() {
  install -Dm755 "$srcdir/drtl-v$pkgver-$CARCH-linux" "$pkgdir/usr/bin/drtl"
}
