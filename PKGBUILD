# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-python-hpilo
pkgname=python-hpilo
pkgver=2.6.1
pkgrel=1
pkgdesc='Accessing the HP iLO XML interface from python'
arch=('any')
url='https://pythonhosted.org/python-hpilo/'
license=('GPL')
depends=('python')
options=(!emptydirs)
source=("https://github.com/seveas/$pkgname/archive/$pkgver.tar.gz")
md5sums=('5ba543569b278bea3139aa02fa18494d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
