pkgname='termtrack'
pkgver=0.7.4
pkgrel=1
pkgdesc='Track satellites in your terminal'
arch=('any')
url='https://github.com/trehn/termtrack'
license=('GPL3')
depends=('python-click' 'python-pillow' 'python-pyshp' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

build() {
  cd "$srcdir/termtrack"
  python setup.py build
}

package() {
  cd "$srcdir/termtrack"
  python setup.py install --root="$pkgdir/" --optimize=1
}

