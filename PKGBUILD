# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-robot-detection' 'python2-robot-detection')
_pkgbase='robot-detection'
pkgver=0.3
pkgrel=1
pkgdesc="Library for detecting if a HTTP User Agent header is likely to be a bot"
arch=(any)
url="https://pypi.python.org/pypi/robot-detection"
license=('GPL')
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/r/robot-detection/robot-detection-${pkgver}.tar.gz")
sha256sums=('a5baf71cf69d95a167b6bd93e026bddd010d40adfc35bde02a61b651f61e6f47')

package_python-robot-detection() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-robot-detection() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
