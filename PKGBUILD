# Maintainer: gardar <aur@gardar.net>

pkgname=python-jsonxs
pkgver=0.6
pkgrel=1
pkgdesc="A Python library for working with JSON using XPath-like syntax"
arch=('any')
url="https://github.com/fboender/jsonxs"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bf36f451d1bac2839d67d5fb386911c2844debbafdb120c64471dd5312eafcfe')

build() {
  cd "$srcdir/jsonxs-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/jsonxs-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

