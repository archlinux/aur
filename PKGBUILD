# Maintainer: João Victor Soares <joao.victor.ssv@outlook.com>

pkgname=fvm
pkgver=2.4.1
pkgrel=2
pkgdesc="Flutter Version Management: A simple cli to manage Flutter SDK versions."
arch=('x86_64')
url="https://github.com/leoafarias/fvm"
license=('MIT')
depends=()
optdepends=()
provides=('fvm')
source=(
  "$url/releases/download/$pkgver/fvm-$pkgver-linux-x64.tar.gz"
)
conflicts=()
OPTIONS=()
sha256sums=(
  '03db8f332ab0eab6bcbfb0c630ed9eb40a7bbe9fd4647282e2bbf7ea1b3f0ad3'
)

package() {
  cd $srcdir

  tar -xf "fvm-${pkgver}-linux-x64.tar.gz"
  install -Dm755 "${srcdir}/fvm/fvm" "${pkgdir}/usr/bin/fvm"
  install -Dm644 "${srcdir}/fvm/src/LICENSE" "${pkgdir}/usr/share/licenses/fvm/LICENSE"
}
