# Maintainer: John Jenkins twodopeshaggy@gmail.com

pkgname=python-wordnik
pkgver=2.1.2
pkgrel=1
pkgdesc="Wordnik API for Python"
arch=('any')
url="https://pypi.python.org/pypi/wordnik/"
license=('APACHE')
makedepends=('git')
depends=('python' 'python-setuptools')
source=(https://pypi.python.org/packages/source/w/wordnik-py3/wordnik-py3-$pkgver.tar.gz)
md5sums=('1a73187cc7b61a0e426fda94ade31925')

package() {
   cd "$srcdir/wordnik-py3-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
}
