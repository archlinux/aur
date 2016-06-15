# Maintainer: Tatsuyuki Ishi <ishitatsuyuki at gmail dot com>
pkgname=('python-arrow' 'python2-arrow')
pkgver=0.8.0
pkgrel=1
pkgdesc="Better dates and times for Python"
arch=('any')
url="http://crsmithdev.com/arrow/"
license=('GPL')
makedepends=('python' 'python-dateutil' 'python-nose' 'python2' 'python2-dateutil' 'python2-nose')
source=("https://pypi.python.org/packages/58/91/21d65af4899adbcb4158c8f0def8ce1a6d18ddcd8bbb3f5a3800f03b9308/arrow-0.8.0.tar.gz")
sha256sums=('b210c17d6bb850011700b9f54c1ca0eaf8cbbd441f156f0cd292e1fbda84e7af')

package_python-arrow() {
  depends=('python' 'python-dateutil' 'python-nose')
  cd "${srcdir}/arrow-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-arrow() {
  depends=('python2' 'python2-dateutil' 'python2-nose')
  cd "${srcdir}/arrow-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
