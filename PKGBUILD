# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Philipp Schmitt <philipp@schmitt.co>

pkgname=python-hpilo
pkgver=4.4.1
pkgrel=1
pkgdesc='Accessing the HP iLO XML interface from python'
arch=('any')
url='https://github.com/seveas/python-hpilo'
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/seveas/$pkgname/archive/$pkgver.tar.gz")
md5sums=('6e261f94eaaf230c88fd857500ab0e0b')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

