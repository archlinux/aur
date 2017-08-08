pkgname=python2-autowig
pkgver=1.0.0a
_pkgver=1.0.0-alpha
pkgrel=1
pkgdesc="Automatic Wrapper and Interface Generator"
url="http://autowig.readthedocs.org"
arch=(any)
license=('CeCILL')
makedepends=('python2-setuptools')
depends=('python2-mako' 'python2-dateutil' 'python2-parse' 'python2-pygments' 'python2-pypandoc' 'python2-path.py' 'clang' 'python2-numpy')
source=("https://github.com/StatisKit/AutoWIG/archive/v${_pkgver}.tar.gz")
sha1sums=('aea4448005bc480a080585854c317cc944926907')

build() {
  cd "${srcdir}"/AutoWIG-${_pkgver}
  python2 setup.py build
}

package() {
  cd "${srcdir}"/AutoWIG-${_pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1
}

package() {
  cd "${srcdir}"/AutoWIG-${_pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1
}
