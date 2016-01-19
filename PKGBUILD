# Maintainer: Trevor <assviolat0r at live dot com>

pkgname=python-rivescript
pkgver=1.8.1
pkgrel=1
pkgdesc="Rendering Intelligence Very Easily"
arch=('any')
license=('MIT')
depends=('python2' 'python-six' 'python2-six' 'python-setuptools' 'python2-setuptools')
url=('https://pypi.python.org/pypi/rivescript')
source=('https://pypi.python.org/packages/source/r/rivescript/rivescript-1.8.1.tar.gz')
md5sums=('86cba9b7b1cf846d83d61f8ddeafa386')
_distdir="rivescript-1.8.1.tar.gz"

package() {
   cd "$srcdir/$_distdir"
   python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 || return 1
}




