# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=python-wordnik
pkgver=2.1.3
pkgrel=1
pkgdesc="Wordnik API for Python"
arch=('any')
url="https://pypi.python.org/pypi/wordnik/"
license=('APACHE')
makedepends=('git')
depends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/source/w/wordnik/wordnik-$pkgver.tar.gz)
md5sums=('b64ff6a8baf16ba3c819ae36fc16917c')

package() {
   cd "$srcdir/wordnik-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
}
