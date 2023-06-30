# Maintainer: Docler <hello@docler.me>

pkgname=fvm-bin
pkgver=2.4.1
pkgrel=2
pkgdesc="Flutter Version Management: A simple CLI to manage Flutter SDK versions."
url="https://github.com/fluttertools/fvm"
arch=('x86_64')
license=('MIT')
depends=()
optdepends=()
provides=('fvm')
source=(
  "$url/releases/download/$pkgver/fvm-$pkgver-linux-x64.tar.gz"
)
sha256sums=(
  '78498cfe331b9f4d2c8ebd97ebe17d3b19ac20c391c3d688525baf764170c0b9'
)
conflicts=()
OPTIONS=()

package() {
  cd $srcdir
  tar -xf "fvm-${pkgver}-linux-x64.tar.gz"
  install -Dm755 "${srcdir}/fvm/fvm" "${pkgdir}/usr/bin/fvm"
  install -Dm644 "${srcdir}/fvm/src/LICENSE" "${pkgdir}/usr/share/licenses/fvm/LICENSE"
}
