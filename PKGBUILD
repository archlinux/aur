# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=Flask-Compress
pkgname='python2-flask-compress'
pkgver='1.3.2'
pkgrel='1'
pkgdesc='custom actions for flask to help manage your application'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Compress/'
license=('BSD')
depends=('python2-flask')
makedepends=('python2-setuptools')

source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
sha1sums=('a046f42f23f29028be4d59d4f021620f0a573732')

build() {
  cd "Flask-Compress-${pkgver}"
  python2 ./setup.py build
}

package() {
  cd "Flask-Compress-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr"
}

# vim:set ts=2 sw=2 et:
