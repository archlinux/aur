# Maintainer: Docler <hello@docler.me>

pkgname=fvm-bin
pkgver=2.3.1
pkgrel=1
pkgdesc="Flutter Version Management: A simple CLI to manage Flutter SDK versions."
url="https://github.com/fluttertools/fvm"
arch=('x86_64')
license=('MIT')
depends=()
optdepends=()
source=(
  "$url/releases/download/$pkgver/fvm-$pkgver-linux-x64.tar.gz"
)
sha256sums=(
  '4431ac11108b69b1e908f581bd3b3f6a1ba82e1f0783fd563e3b294b009709f0'
)
conflicts=()
OPTIONS=()

package() {
  cd $srcdir
  tar -xf "fvm-${pkgver}-linux-x64.tar.gz"
  install -Dm755 "${srcdir}/fvm/fvm" "${pkgdir}/usr/bin/fvm"
  install -Dm644 "${srcdir}/fvm/src/LICENSE" "${pkgdir}/usr/share/licenses/fvm/LICENSE"
}
