# Contributor: Médéric Boquien <mboquien@free.fr>
# Maintainer: Médéric Boquien <mboquien@free.fr>
pkgname=python-pyavm
pkgver=0.9.4
pkgrel=1
pkgdesc="Module to represent, read, and write Astronomy Visualization Metadata"
arch=('any')
url="http://astrofrog.github.io/pyavm/"
license=("MIT")
depends=('python>=3.5')
source=("https://pypi.python.org/packages/source/P/PyAVM/PyAVM-${pkgver}.tar.gz")
sha512sums=('95b10a57206dcace2941342015155ad46c6d71fd11963e5516d766067d2074d2302b60d6455b2194034beb6668c2a989cbf88908871d2bacd28ba6433a83a89e')

build() {
  cd ${srcdir}/PyAVM-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/PyAVM-${pkgver}
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

