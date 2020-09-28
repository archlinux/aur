# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Philipp Schmitt <philipp@schmitt.co>

pkgname=python-hpilo
pkgver=4.3
pkgrel=1
pkgdesc='Accessing the HP iLO XML interface from python'
arch=('any')
url='https://github.com/seveas/python-hpilo'
license=('GPL')
depends=('python')
options=(!emptydirs)
source=("https://github.com/seveas/$pkgname/archive/$pkgver.tar.gz")
md5sums=('99f611fe3da652bd0a56b2e5b5a22299')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

