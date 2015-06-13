# Maintainer: Sébastien Leduc <sebastien@sleduc.fr>

pkgname=python2-rpc4django
_realname=rpc4django
pkgver=0.3.0
pkgrel=1
pkgdesc="Handles JSONRPC and XMLRPC requests easily with Django"
arch=("any")
url="https://rpc4django.readthedocs.org/"
license=('BSD')
depends=('python2' 'python2-django' 'python2-defusedxml')
optdepends=('python2-docutils')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/r/rpc4django/$_realname-$pkgver.tar.gz")
md5sums=('fd1169715ed0995fefae815906741e49')

package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
