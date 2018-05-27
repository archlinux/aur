pkgname=ruri
pkgver=1.0.8
pkgrel=1
pkgdesc="A CRC32 checker with file name checking."
arch=(any)
url="https://github.com/Timmy1e/ruri"
license=(GPL3)
depends=(
  "python"
  "python-colorama"
  "python-progressbar"
)
makedepends=(
  "python-pip"
)
build() {
  pip install --quiet --no-deps --root="$srcdir/" ruri==${pkgver}
}
package() {
  cp -R $srcdir/* $pkgdir/
}
