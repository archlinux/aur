_name='persistentlist'
pkgname="python-${_name}"
pkgver=0.4
pkgrel=2
pkgdesc="Persistentlist is a simple persistent list carrying n objects, the last objects being appended at the end of the list."
url="https://pypi.org/project/persistentlist/"
arch=('any')
license=('GPL3')
depends=('python')
makedepends=('python' 'python-setuptools')
source=(
    "https://files.pythonhosted.org/packages/f4/a8/ca8dbd3bbc1cbabb2bb9e1376ade4aeea08403dc73148b1a6f476c840e3b/persistentlist-0.4.tar.gz"
)

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python3 setup.py build
  python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

md5sums=('6850c0605a3b017857f7406474e4cc68')
