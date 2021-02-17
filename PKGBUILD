# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_payment_braintree
_name=trytond_account_payment_braintree
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for Braintree payment"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e1b87304a7e1ddbac5b8f8fb624060a4578f5a0e57f8380851c55607f7469ac5')
sha512sums=('ded358f1276564189f5b951b0362ead3b9401cfbc56b1123281e5d258807ab9b3e49ebb4cdff48b91d7c9f44df50b5b0097361d80e450c19172ec27685ac6947')
b2sums=('bb35f77175777cb84e21e85c5f17f9e842034d54e3cd226a8adc42b0aff5efd606f0344a89a8fd6f67df88dc2c0b0633a6972394f3c90dea6bc8b60da49985c4')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
