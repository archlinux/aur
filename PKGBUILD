# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=rayfish
pkgver=0.5.2
pkgrel=1
pkgdesc="P2P mesh VPN powered by iroh"
arch=('x86_64' 'aarch64')
url="https://github.com/rayfish/rayfish"
license=('MPL-2.0')
depends=('gcc-libs')
options=(!strip)

source_x86_64=("ray-linux-x86_64-$pkgver::$url/releases/download/v$pkgver/ray-linux-x86_64")
source_aarch64=("ray-linux-aarch64-$pkgver::$url/releases/download/v$pkgver/ray-linux-aarch64")

sha256sums_x86_64=('4b85d32c2cff117e4ada6f9af4a954892bd323653db322b8325ca937c209a568')
sha256sums_aarch64=('8191382473bf3cab91fd999c6b77ea06326f6304a0bf8f4948fc5911b16c1d1b')

package() {
  install -Dm755 "$srcdir/ray-linux-$CARCH-$pkgver" "$pkgdir/usr/bin/ray"
}
