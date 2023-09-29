# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.12
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('52f1c7276debae373b72052389059d7d7fd229defb6ab65e472883c5d95f497e6f9647300379c7b1ca6b6e12822d81c557f29fea5ebed731b766b69bcbd31477')
b2sums_aarch64=('aab1a290fefdf969beacb49f1f26855957cf7e76dff8e22e92fe44236550cd9ce22c1d0277149960a6ae5a7de484d86333bf31415541781060052eefa6164b54')

package() {
  install -Dm755 "$srcdir/drtl-v$pkgver-$CARCH-linux" "$pkgdir/usr/bin/drtl"
}
