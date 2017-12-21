# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-rednose'
pkgver=1.2.3
pkgrel=1
pkgdesc="Pretty output formatter for python-nosetests"
arch=('x86_64')
url="https://github.com/JBKahn/rednose"
license=('BSD')
depends=('python' 'python-colorama' 'python-termstyle>=0.1.7')
makedepends=('python-setuptools')
provides=('python-rednose')
conflicts=('python-rednose')
options=(!emptydirs)
source=("https://github.com/JBKahn/rednose/archive/${pkgver}.tar.gz")
md5sums=('90eb1b96d36db1f807f2fe1285dddd73')

package() {
  cd "${srcdir}/rednose-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
