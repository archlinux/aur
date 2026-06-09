# Maintainer: Scott Alfter <scott@alfter.us>
pkgname=ciderpress2
pkgver=1.2
pkgrel=1
pkgdesc="Apple II file and disk image utility"
arch=("x86_64")
url="https://ciderpress2.com/"
license=("Apache-2.0")
source=("$pkgname-$pkgver.zip::https://github.com/fadden/CiderPress2/releases/download/v1.2.0/cp2_1.2.0_linux-x64_sc.zip")
md5sums=("e9154566c6b4355ef115e36c9d449dc7")

package() {
  mkdir -p "$pkgdir"/opt/cp2
  cp "$srcdir"/* "$pkgdir"/opt/cp2/
}

post_install() {
  echo "Add /opt/cp2 to your PATH."
}
