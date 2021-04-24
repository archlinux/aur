# Maintainer: Markus Näther <naetherm@cs.uni-freiburg.de>
pkgname=python-py-params
pkgver=0.10.2
pkgrel=1
pkgdesc="A type-safe dictionary class for python."
url="https://github.com/kpe/py-params"
arch=(x86_64)
makedepends=(git python 'python-setuptools')
_pkgver="0.9.7"
source=(
  "https://github.com/kpe/py-params/archive/v$pkgver.tar.gz"
)
sha256sums=(
  "4be4e7dec0826fbbabd01872b8dc95df57ee98a1ab933aa6eebe66d6a5a2a07f"
)


build() {
    cd "$srcdir/py-params-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/py-params-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
