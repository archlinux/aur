# Maintainer: madprops <mprops at protonmail dot com>

pkgname="effer-bin"
pkgdesc="Create encrypted notes in the terminal"
pkgver=2.0.3
pkgrel=1
arch=("x86_64")
url="https://github.com/Merkoba/Effer"
license=("Apache")
sha256sums=("8dcfefcc8182119e217361bb9e1c8ba4446244039aea9f4462485b253a5857c1")
conflicts=("effer" "effer-git")
source=("$pkgname::$url/releases/download/v$pkgver/effer")

package() {
  install -D -m755 effer-bin "$pkgdir/usr/bin/effer"
}