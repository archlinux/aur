# Maintainer: Sebastien Leduc <sebastien AT sleduc DOT fr>

pkgname=('python-rpyc')
_realname=rpyc
pkgver=3.3.0
pkgrel=1
pkgdesc="Remote Python Call (RPyC), a transparent and symmetric RPC library"
url="http://rpyc.readthedocs.org"
arch=('any')
license=('MIT')
depends=('python' 'python-plumbum')
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/source/r/rpyc/$_realname-$pkgver.tar.gz")
md5sums=('6931cb92c41f547591b525142ccaeef1')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir"/ --optimize=1
}

# vim:set ts=2 sw=2 et:
