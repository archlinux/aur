# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
pkgname=python2-trollius
_realname=trollius
pkgver=2.0
pkgrel=1
pkgdesc="Port of the Tulip project (asyncio module, PEP 3156) on Python 2.7"
arch=("any")
url="http://trollius.readthedocs.org/"
license=('APACHE')
depends=('python2' 'python2-futures')
optdepends=('python2-unittest2: to pass trollius unit tests')
source=("http://pypi.python.org/packages/source/t/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('5704231bc385660783c5fad59e75549d')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
