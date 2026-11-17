# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=fluentci
pkgver=0.17.8
pkgrel=1
pkgdesc="Set up and run your CI locally or in any CI Provider in a consistent way"
arch=('x86_64' 'aarch64')
url="https://github.com/fluentci-io/fluentci"
license=('MPL-2.0')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname}_v${pkgver}_aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d9827ac3d0d8e4e868b206c37cd621a424e1fb3812fba46c4cdc9344b0d7c322')
sha256sums_aarch64=('2c7ce904330202b607d8eba8cc9671ca5b9563e3dd5c6712ed9ac6e49ce4f9cb')
options=('!strip') # stripping breaks the binary

package() {
  install -D -m 755 -t "${pkgdir}/usr/bin" "$srcdir/$pkgname"
}
