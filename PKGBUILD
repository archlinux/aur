#Maintainer: Randy Heydon <randy.heydon at clockworklab dot net>
pkgname=python-pylibftdi
pkgver=0.14
pkgrel=1
pkgdesc="Pythonic interface to FTDI devices using libftdi"
arch=(any)
url="http://bitbucket.org/codedstructure/pylibftdi"
license=('MIT')
depends=('python' 'libftdi')
source=(http://pypi.python.org/packages/source/p/pylibftdi/pylibftdi-$pkgver.tar.gz)
md5sums=('974d43f72e07af71ccf675e5cf12cf8a')

package () {
  cd $srcdir/pylibftdi-$pkgver
  python ./setup.py install --root=$pkgdir --optimize=1 || return 1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
