# Maintainer: Sébastien Leduc <sebastien@sleduc.fr>

pkgname="python-rpc4django"
pkgbase='python-rpc4django'
_realname=rpc4django
pkgver=0.6.3
pkgrel=2
pkgdesc="Handles JSONRPC and XMLRPC requests easily with Django"
arch=("any")
url="https://rpc4django.readthedocs.org/"
license=('BSD')
makedepends=('python')
options=(!emptydirs)
source=("https://github.com/rpc4django/rpc4django/archive/v$pkgver.tar.gz")
md5sums=('978126fdddeb70879c0e605ad565b309')

package_python-rpc4django() {
  depends=('python' 'python-django' 'python-defusedxml')
  optdepends=('python-docutils')
  cd "$srcdir/$_realname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
# vim:set ts=2 sw=2 et:
