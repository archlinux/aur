# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=rayfish
pkgver=0.4.1
pkgrel=1
pkgdesc="P2P mesh VPN powered by iroh"
arch=('x86_64' 'aarch64')
url="https://github.com/rayfish/rayfish"
license=('MPL-2.0')
depends=('gcc-libs')
options=(!strip)

source_x86_64=("ray-linux-x86_64-$pkgver::$url/releases/download/v$pkgver/ray-linux-x86_64")
source_aarch64=("ray-linux-aarch64-$pkgver::$url/releases/download/v$pkgver/ray-linux-aarch64")

sha256sums_x86_64=('fc2099c8edf6b1f4b93982e0ee0145215ed81d776850b5c5ddfde04311e1a23c')
sha256sums_aarch64=('dd9aec4355f279d383467fd3ccdc40534ac89b9413a8b5318d83e8c1e2769adc')

package() {
  install -Dm755 "$srcdir/ray-linux-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
}
