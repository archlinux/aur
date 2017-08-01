# Maintainer: Nicholas Yam <nickyim05@gmail.com>

pkgname=python-flask-jsonrpc
pkgver=0.3.1
pkgrel=1
pkgdesc="Adds JSONRPC support to Flask."
arch=('any')
depends=('python-flask')
makedepends=('python-setuptools')
url="https://github.com/cenobites/flask-jsonrpc"
license=('BSD 3-clause')
options=(!emptydirs)
source=(https://pypi.python.org/packages/cb/1f/e6d66e8498609ba04bac76155b2ea884df95531e93501bf4ef009d40a83c/Flask-JSONRPC-0.3.1.tar.gz)
md5sums=('5c0592f53b2f18e34d5be435acee8842')
sha256sums=('4d0cc9c20874093306af91f5a48009fb8659a041428dcdb11703598ffbbc97d0')

build() {
  cd "$srcdir/Flask-JSONRPC-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/Flask-JSONRPC-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
