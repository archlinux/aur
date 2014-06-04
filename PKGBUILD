# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python2-flask-cors
pkgname=python2-flask-cors
_pkgname=Flask-Cors
pkgver=1.3.1
pkgrel=1
pkgdesc="A Flask extension adding a decorator for CORS support"
arch=('any')
url='https://pypi.python.org/pypi/Flask-Cors'
license=('')
depends=('python2')
options=(!emptydirs)
        # hhttps://pypi.python.org/packages/source/F/Flask-Cors/Flask-Cors-1.3.1.tar.gz
source=("https://pypi.python.org/packages/source/F/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('70adebadf9e21930c50b89965b7c9973')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
