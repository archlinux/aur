# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: Adrian Sampson <adrian@radbox.org>

pkgname=python-munkres
pkgver=1.0.8
pkgrel=3
pkgdesc='munkres algorithm for the assignment problem'
depends=('python')
makedepends=('python-setuptools')
arch=('any')
source=("https://pypi.python.org/packages/07/17/5debec658b151d39c7a29fcc830bbfb5cb22f18e7ff7d6537deab73943ab/munkres-$pkgver.tar.gz")
sha512sums=('e0afda8b91e51d177b9e2dc66ccacce849649d1a7d0e756884ac030acf4080076aa428182c5e9366613ee16db338ba7dcd3c38977de0888781b1885f08cb8236')
url='http://bmc.github.com/munkres/'
license=('BSD')

build() {
  cd "$srcdir/munkres-$pkgver"
  /usr/bin/python setup.py build
}

package() {
  cd "$srcdir/munkres-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir"
}
