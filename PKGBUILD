# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=python2-lcdproc
pkgver=0.03
pkgrel=3
pkgdesc="Python OOP Wrapper Library for LCDproc Telnet API"
arch=('any')
url="http://github.com/jingleman/lcdproc"
license=('BSD')
makedepends=('python2-pip')
depends=('python2')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/l/lcdproc/lcdproc-$pkgver.tar.gz)
md5sums=('177328fd30c973151b5e75f9c1b992c7')

package() {
  cd "$srcdir/lcdproc-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
