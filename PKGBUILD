# Maintainer: Markus Näther <naether.markus@gmail.com>
pkgname=python-proxyscrape
pkgver=0.3.0
pkgrel=2
pkgdesc="Python library for retrieving free proxies"
url="https://github.com/jaredlgillespie/proxyscrape"
arch=(x86_64)
makedepends=('git' 'python' 'python-setuptools')
_pkgver="0.3.0"
source=(
  "git+https://github.com/jaredlgillespie/proxyscrape.git"
)
sha256sums=(
  "SKIP"
)


build() {
    cd "$srcdir/proxyscrape"
    python setup.py build
}

package() {
    cd "$srcdir/proxyscrape"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
