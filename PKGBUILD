# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_payment_sepa_cfonb
_name=trytond_account_payment_sepa_cfonb
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for CFONB SEPA payment"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('79cb0ee0ed673eb91cd8bd9d71bab52919bdb3837a8932766adc539fa5a9d055')
sha512sums=('cea29a20a07b660a1e8f912c93578376202965446f9d0cfb049876f2d960a1ba7859bf4a9ae536e861a9db98e89bd6603034e0cb5fb17329078c1a75df8980a9')
b2sums=('241fc885b99d3115a420554576bac97c1333ccaa1afc20fa0bf454dd4151c5bd8b4457853fff8ab5a0d6a8cd2fe3598546d3e262006214080a6149586ba6def6')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
