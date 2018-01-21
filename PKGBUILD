# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Vinicius de Avila <vinicius.avila.jorge@gmail.com>
# Update Based on Geoff Teale's PKGBUILD. To support only python2
_name=odfpy
pkgname=python2-odfpy
pkgver=1.3.6
pkgrel=1
pkgdesc="A complete API for OpenDocument in Python. Python 2.x support"
arch=('i686' 'x86_64')
url="http://opendocumentfellowship.com/projects/odfpy"
license=('GPL')
depends=('python2')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('6acc14dbb96b3e442ba095094d5a3143')

build() {
  cd "$srcdir/odfpy-${pkgver}"
  python2 setup.py build
}

package() {
  cd "$srcdir/odfpy-${pkgver}"
  python2 setup.py install --root=${pkgdir}
}
