# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=bugmenot
pkgver=0.1
pkgrel=1
pkgdesc="An unofficial Python package to retrieve credentials from BugMeNot.com"
arch=("any")
url="https://github.com/ptrstn/bugmenot"
license=("Unlicense")
makedepends=("python-setuptools")
depends=("python")
source=("https://github.com/ptrstn/bugmenot/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("0e51c3db0e25626553b98f25e23948a7c4c65ab9a031b9e7dcc20ec9a0ba7647")

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1
}
