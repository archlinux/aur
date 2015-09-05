# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Vinicius de Avila <vinicius.avila.jorge@gmail.com>
# Update Based on Geoff Teale's PKGBUILD. To support only python2
pkgname=python2-odfpy
pkgver=1.3.1
pkgrel=1
pkgdesc="A complete API for OpenDocument in Python. Python 2.x support"
arch=('i686' 'x86_64')
url="http://opendocumentfellowship.com/projects/odfpy"
license=('GPL')
depends=('python2')
source=("http://pypi.python.org/packages/source/o/odfpy/odfpy-$pkgver.tar.gz")
md5sums=('c9ac8cdab35c68388cc594793b57a984')

build() {
  cd "$srcdir/odfpy-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/odfpy-${pkgver}"
  python2 setup.py install --root=${pkgdir}
}
