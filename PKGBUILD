# Maintainer: hyperpuncher

pkgname=iq-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Interactive jq REPL"
arch=('x86_64' 'aarch64')
url="https://github.com/hyperpuncher/iq"
license=('MIT')
provides=("iq=$pkgver")
conflicts=('iq')

source_x86_64=("$pkgname-$pkgver::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-x64")
sha256sums_x86_64=('106aeb07e6734ad6ab8e3386a62795f8b7f2c652898dc7613b910b6d15266630')

source_aarch64=("$pkgname-$pkgver::https://github.com/hyperpuncher/iq/releases/download/v$pkgver/iq-linux-arm64")
sha256sums_aarch64=('5796e4c8f4f281ee58325008793ce3928eef05f750239227d1c84fd4e975f915')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/iq"
}
