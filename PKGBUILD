# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=drtl-bin
pkgver=0.0.14
pkgrel=1
pkgdesc='Yet another tldr client written in Zig.'
url='https://github.com/jiripospisil/drtl'
source_x86_64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-x86_64-linux")
source_aarch64=("https://github.com/jiripospisil/drtl/releases/download/v$pkgver/drtl-v$pkgver-aarch64-linux")
arch=('x86_64' 'aarch64')
provides=('drtl')
conflicts=('drtl')
license=('MIT')
b2sums_x86_64=('af28175d644408c0ee65a611195c460d240578b7a2ad0c5baf22b3477c65a87383d1ffa016a8737456f3f2e151f648baa16171404985f96d5b9ac388b8cb95d2')
b2sums_aarch64=('780860b2cc0e8a3c543919a9834763ad754fff2512acd6e9fc533b38a78bf4452a326111197fe3de61da42da56674ee43eb652e1c99037478b15d4862cba8941')

package() {
  install -Dm755 "$srcdir/drtl-v$pkgver-$CARCH-linux" "$pkgdir/usr/bin/drtl"
}
