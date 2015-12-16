# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Adapted from python-progressbar2 by Maxim Andersson <thesilentboatman@gmail.com>

pkgname=python2-progressbar2-old
_pkgname=python-progressbar
pkgver=2.7.3
pkgrel=1
pkgdesc="Progressbar library to provide visual (yet text based) progress to long running operations"
arch=('any')
url="https://github.com/WoLpH/python-progressbar"
license=('BSD')
depends=('python2')
provides=('python2-progressbar')
conflicts=('python2-progressbar')
source=("https://pypi.python.org/packages/source/p/progressbar2/progressbar2-${pkgver}.tar.gz")
sha256sums=('8366ffc752ebe3c8e50db2699b7b1dc3cb6ff3750065e965a2591ac50270b794')

package() {
  cd "${srcdir}/progressbar2-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
