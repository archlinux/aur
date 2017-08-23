# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=Flask-Compress
pkgname=('python2-flask-compress' 'python-flask-compress')
pkgbase='python2-flask-compress'
pkgver='1.4.0'
pkgrel='1'
pkgdesc='custom actions for flask to help manage your application'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Compress/'
license=('BSD')
source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
sha1sums=('68b5eb124b02993c9466dfb2438e0ba79d2d5809')

package_python2-flask-compress() {
  depends=('python2-flask')
  makedepends=('python2-setuptools')
  cd "Flask-Compress-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --prefix="/usr"
}

package_python-flask-compress() {
  depends=('python-flask')
  makedepends=('python-setuptools')
  cd "Flask-Compress-${pkgver}"
  python ./setup.py install --root="${pkgdir}" --prefix="/usr"
}

# vim:set ts=2 sw=2 et:
