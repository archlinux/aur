# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=rayfish
pkgver=0.5.0
pkgrel=1
pkgdesc="P2P mesh VPN powered by iroh"
arch=('x86_64' 'aarch64')
url="https://github.com/rayfish/rayfish"
license=('MPL-2.0')
depends=('gcc-libs')
options=(!strip)

source_x86_64=("ray-linux-x86_64-$pkgver::$url/releases/download/v$pkgver/ray-linux-x86_64")
source_aarch64=("ray-linux-aarch64-$pkgver::$url/releases/download/v$pkgver/ray-linux-aarch64")

sha256sums_x86_64=('602f1c2ba50df8bb36286326f34185129047470c859f5554bfb185d8ba2ef40f')
sha256sums_aarch64=('cabdbae7651546f0821a139c48ec0aa8ab71120072e2db5ad50c16f5e96f7516')

package() {
  install -Dm755 "$srcdir/ray-linux-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
}
