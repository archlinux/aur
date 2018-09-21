# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_pkgname=simplekml
pkgname=python-simplekml
pkgver=1.3.0
pkgrel=2
pkgdesc='Simplekml is a python package which enables you to generate KML with as little effort as possible.'
arch=('any')
url="https://www.simplekml.com/"
license=('GPL3')
depends=('python')
source=('https://pypi.python.org/packages/a7/dd/a7628e278507d76b3708a81f60bb719af58ca0123cbee50094f7d90e560f/simplekml-1.3.0.zip')
md5sums=('a9f133bde1c0edff6166739faccc11a1')

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir"
}
