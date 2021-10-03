# Maintainer:  <zhaose@empty-PC>
pkgname=ascii-image-converter
pkgver=1.10.0
pkgrel=1
pkgdesc="A cross-platform command-line tool to convert images into ascii art and print them on the console."
arch=('x86_64')
url="https://github.com/TheZoraiz/ascii-image-converter"
license=('GPL')
makedepends=()
checkdepends=()
optdepends=()
provides=()
source=("ascii-image-converter-${pkgver}.tar.gz::https://github.com/TheZoraiz/ascii-image-converter/releases/download/v${pkgver}/ascii-image-converter_Linux_amd64_64bit.tar.gz")
md5sums=('96a4e86a4136c0e1d54e975a23ee566d')

package() {
  cd "$srcdir/ascii-image-converter_Linux_amd64_64bit"

  install -Dm 755 ./ascii-image-converter -t "$pkgdir/usr/bin/"
  install -Dm 644 ./LICENSE.txt -t "$pkgdir/usr/share/licenses/ascii-image-converter/"
}

# vim:set ts=2 sw=2 et:
