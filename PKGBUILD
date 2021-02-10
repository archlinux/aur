# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Philipp Schmitt <philipp@schmitt.co>

pkgname=python-hpilo
pkgver=4.4.3
pkgrel=1
pkgdesc='Accessing the HP iLO XML interface from python'
arch=('any')
url='https://github.com/seveas/python-hpilo'
license=('Apache' 'GPL')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/seveas/$pkgname/archive/$pkgver.tar.gz")
md5sums=('e278b48bf8e511f97e7e43ad70496739')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/license"
}

