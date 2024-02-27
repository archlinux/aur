# Maintainer: Jesus Alonso: <doragasu at hotmail dot com>
pkgname=python-flatten-json
pkgver=0.1.13
pkgrel=2
pkgdesc="Flattens JSON objects in Python. flatten_json flattens the hierarchy in your object which can be useful if you want to force your objects into a table."
arch=('any')
url="https://github.com/amirziai/flatten"
license=('MIT')

depends=('python')

makedepends=('python-setuptools' )

source=(${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('d71dc07e1b7c3c17ffa01625f43a860b4979664744c402dbf749b51f8d2b768d71f5c09742189444b1aac15036e8626a8802b4072450bffbb27be8b6e55780bd')

package() {
  cd "$srcdir/flatten-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

