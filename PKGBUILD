# Contributor: Médéric Boquien <mboquien@free.fr>
# Maintainer: Médéric Boquien <mboquien@free.fr>
pkgname=python-pyavm
pkgver=0.9.2
pkgrel=2
pkgdesc="Module to represent, read, and write Astronomy Visualization Metadata"
arch=('any')
url="http://astrofrog.github.io/pyavm/"
license=("MIT")
depends=('python>=3.1')
source=("https://pypi.python.org/packages/source/P/PyAVM/PyAVM-${pkgver}.tar.gz")
md5sums=('da9b19ba6f4ccafcccb644fbd998bade')

build() {
  cd ${srcdir}/PyAVM-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/PyAVM-${pkgver}
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

