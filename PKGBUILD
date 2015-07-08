# Contributor: Vinicius de Avila <vinicius.avila.jorge@gmail.com>
# Update Based on Geoff Teale's PKGBUILD. To support only python2
pkgname=python2-odfpy
pkgver=0.9.6
pkgrel=1
pkgdesc="A complete API for OpenDocument in Python. Python 2.x support"
arch=('i686' 'x86_64')
url="http://opendocumentfellowship.com/projects/odfpy"
license=('GPL')
depends=('python2')
conflicts=('odfpy' 'python-odfpy' 'python3-odfpy' 'python-all-odfpy')
source=("http://pypi.python.org/packages/source/o/odfpy/odfpy-$pkgver.tar.gz")
md5sums=('3f570ead2b5f5eb6eab97eecce22d491')

build() {
  cd "$srcdir/odfpy-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/odfpy-${pkgver}"
  python2 setup.py install --root=${pkgdir}
}
