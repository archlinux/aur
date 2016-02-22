# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python2-flask-cors
pkgname=python2-flask-cors
_pkgname=Flask-Cors
pkgver=2.1.2
pkgrel=1
pkgdesc="A Flask extension adding a decorator for CORS support"
arch=('any')
url='https://pypi.python.org/pypi/Flask-Cors'
license=('')
depends=('python2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/F/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('50274b36f1c885669234590009583c43')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
