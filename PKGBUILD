# Maintainer: Sébastien Leduc <sebastien@sleduc.fr>

pkgname=python2-rpc4django
_realname=rpc4django
pkgver=0.4.0
pkgrel=1
pkgdesc="Handles JSONRPC and XMLRPC requests easily with Django"
arch=("any")
url="https://rpc4django.readthedocs.org/"
license=('BSD')
depends=('python2' 'python2-django' 'python2-defusedxml')
optdepends=('python2-docutils')
options=(!emptydirs)
source=("https://pypi.python.org/packages/a2/2b/220ab104e4236a42a2fe7f8cca5d15089ae0587b9cdb929f1841d34224e8/${_realname}-${pkgver}.tar.gz")
md5sums=('a929e046f29a1d1f095312dafb76bb63')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
