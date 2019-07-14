# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_authentication_sms
_name=trytond_authentication_sms
pkgver=5.2.0
_pkgdir=5.2
pkgrel=1
pkgdesc="Tryton module to authenticate users via SMS"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5f30690718bea41b0c3999b096987673d5f87a5552fec264938eddce28fe6ba6')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
