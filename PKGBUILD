# Maintainer: Sébastien Leduc <sebastien@sleduc.fr>

pkgname=("python-rpc4django" "python2-rpc4django")
pkgbase='python-rpc4django'
_realname=rpc4django
pkgver=0.6.3
pkgrel=1
pkgdesc="Handles JSONRPC and XMLRPC requests easily with Django"
arch=("any")
url="https://rpc4django.readthedocs.org/"
license=('BSD')
makedepends=('python' 'python2')
options=(!emptydirs)
source=("https://github.com/rpc4django/rpc4django/archive/v$pkgver.tar.gz")
md5sums=('978126fdddeb70879c0e605ad565b309')

package_python2-rpc4django() {
  depends=('python2' 'python2-django' 'python2-defusedxml')
  optdepends=('python2-docutils')
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-rpc4django() {
  depends=('python' 'python-django' 'python-defusedxml')
  optdepends=('python-docutils')
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:
