# Maintainer: Simon Conseil <contact+aur at saimon dot org>
pkgname=python2-epc
pkgver=0.0.5
pkgrel=1
pkgdesc="EPC (RPC stack for Emacs Lisp) for Python"
arch=('any')
url="https://github.com/tkf/python-epc"
license=('GPL3')
depends=('python2' 'python2-sexpdata')
source=("http://pypi.python.org/packages/source/e/epc/epc-${pkgver}.tar.gz")
md5sums=('de54a24ace8a9b3f5b2d8f014b8c4a42')

package() {
  cd "$srcdir/epc-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
