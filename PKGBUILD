pkgname=python-comedi
_pyname=pycomedi
pkgver=0.7
pkgrel=1
pkgdesc='An object-oriented interface for the Comedi drivers'
arch=('x86' 'i686')
url='https://pypi.python.org/pypi/${_pyname}'
license=('GPL2')
depends=('python' 'cython' 'python-numpy' 'comedilib')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/$(echo ${_pyname} | cut -c1)/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3f059133e24fef637ef40abda19f7ae8')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}
