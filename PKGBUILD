# Maintainer: Clint Valentine <valentine.clint@gmail.com>

_name='declxml'
pkgname='python-declxml'
pkgver=0.10.0
pkgrel=1
pkgdesc="Declarative XML processing for Python."
arch=('x86_64')
url="https://github.com/gatkin/${_name}"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('python-declxml')
conflicts=('python-declxml')
options=(!emptydirs)
source=("https://github.com/gatkin/${_name}/archive/${pkgver}.tar.gz")
md5sums=('2ce79a9e0d5807666a06419eba7fecfc')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
