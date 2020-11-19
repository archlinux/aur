# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Philipp Schmitt <philipp@schmitt.co>

pkgname=python-hpilo
pkgver=4.4.2
pkgrel=1
pkgdesc='Accessing the HP iLO XML interface from python'
arch=('any')
url='https://github.com/seveas/python-hpilo'
license=('Apache' 'GPL')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/seveas/$pkgname/archive/$pkgver.tar.gz")
md5sums=('1544a6c1b90ec9b0953f5084583e8cc2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/license"
}

