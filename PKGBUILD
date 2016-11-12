# Maintainer: Carlo Cabanilla <carlo.cabanilla@gmail.com>
pkgname=cs-script
pkgver=3.17.0.0
pkgrel=1
pkgdesc="Run C# sources like scripts"
arch=('any')
url="https://github.com/oleg-shilo/cs-script"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/${pkgname}.7z")
sha256sums=('049d66880b92d7ee5c88305d80e9bdbd918b76081f44f050175c074d1cc18b04')

package() {
  local sharedir="$pkgdir/usr/share/"
  mkdir -p "$sharedir"
  cp -r "$srcdir/$pkgname" "$sharedir"
}
