# Maintainer: hyperpuncher

pkgname=iq-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Interactive jq REPL"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperpuncher/iq"
license=('MIT')
provides=("iq=$pkgver")
conflicts=('iq')

source_x86_64=("$pkgname-$pkgver::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-x64")
sha256sums_x86_64=('defd1915e017f5b288c8052d7b03115abcef8a8a2c358d1ef38cbfdbeb9a1442')

source_aarch64=("$pkgname-$pkgver::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-arm64")
sha256sums_aarch64=('bbde53e89d11f1702eb6d9ecd2845d917a24ac7c43f04a6a31567689e66e8766')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/iq"
}
