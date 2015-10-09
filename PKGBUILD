# Maintainer: Cedric Girard <girard.cedric@gmail.com>
pkgname='python2-flask-compress'
pkgver='1.3.0'
pkgrel='1'
pkgdesc='custom actions for flask to help manage your application'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Compress/'
license=('BSD')
depends=('python2-flask')
makedepends=('setuptools')

source=("http://pypi.python.org/packages/source/F/Flask-Compress/Flask-Compress-${pkgver}.tar.gz")
sha1sums=('3a5e30a7ce0b927421d5afca416a27f71c6a47f0')

build() {
  cd "Flask-Compress-${pkgver}"
  python2 ./setup.py build
}

package() {
  cd "Flask-Compress-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr"
}

# vim:set ts=2 sw=2 et:
