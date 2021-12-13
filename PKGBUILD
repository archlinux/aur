# Contributor: Médéric Boquien <mboquien@free.fr>
# Maintainer: Médéric Boquien <mboquien@free.fr>
pkgname=python-pyavm
pkgver=0.9.5
pkgrel=2
pkgdesc="Module to represent, read, and write Astronomy Visualization Metadata"
arch=('any')
url="http://astrofrog.github.io/pyavm/"
license=("MIT")
depends=('python>=3.5')
source=("https://pypi.python.org/packages/source/P/PyAVM/PyAVM-${pkgver}.tar.gz")
sha512sums=('911669719bbd99a73989df27e84f645c66d059d16fb31bc2ba320630df60f6f1a98c7f06100f564d643b05467638422a91b75ec03491b57e50986ab9646e3c18')

build() {
  cd ${srcdir}/PyAVM-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/PyAVM-${pkgver}
  python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

