# Contributor: Médéric Boquien <mboquien@free.fr>

pkgname=python2-pyregion
pkgver=2.0
pkgrel=1
pkgdesc="A python module to parse ds9 and ciao region files"
arch=('i686' 'x86_64')
url="https://github.com/astropy/pyregion"
license=("MIT")
depends=('python2' 'python2-numpy>=1.3')
source=("https://files.pythonhosted.org/packages/source/p/pyregion/pyregion-${pkgver}.tar.gz")
md5sums=('c228b133a1573d2017e0857a9fbf23c5')

build() {
  cd ${srcdir}/pyregion-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/pyregion-${pkgver}

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
