#Maintainer: Randy Heydon <randy.heydon at clockworklab dot net>
pkgname=python-pylibftdi
pkgver=0.17.0
pkgrel=1
pkgdesc="Pythonic interface to FTDI devices using libftdi"
arch=(any)
url="http://bitbucket.org/codedstructure/pylibftdi"
license=('MIT')
depends=('python' 'libftdi')
source=("https://bitbucket.org/codedstructure/pylibftdi/get/$pkgver.tar.gz")
md5sums=('2af39b916c319dce09b6a8aa981b4053')

package () {
  cd $srcdir/codedstructure-pylibftdi-*/
  python ./setup.py install --root=$pkgdir --optimize=1 || return 1
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
