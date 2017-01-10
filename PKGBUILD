# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Neil Santos <nsantos16+aur@gmail.com>

pkgname=python-onetimepass
_pkgname=onetimepass
pkgver=1.0.1
pkgrel=1
pkgdesc='Module for generating and validating HOTP and TOTP tokens'
arch=('any')
url='https://github.com/tadeck/onetimepass/'
license=('ISC')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/aa/b2/cb6832704aaf11ed0e471910a8da360129e2c23398d2ea3a71961a2f5746/onetimepass-1.0.1.tar.gz")
md5sums=('1d2aa6422b9077913c1aca1c481c175e')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
