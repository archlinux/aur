# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_fr
_name=trytond_account_fr
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module with French chart of accounts"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e8e2d550c2ccccc8d0c8e67039b3be60ef2156e63ad2038bcdbadf74ab947d7d')
sha512sums=('1b73976a7fad6a867497a9534edd05b187ebd895f55bff217bd3869384d6db5d59df38dafd21a65257f5881dd57c15260095db41de1eb5e6681f26b2bce83691')
b2sums=('ad0b6300a49596dc56db456d73d12dece75bb86ba16d97bb25a8ad722a53b3d7025f5e4f36401011cdf16a25b1a43166155a598822c5b838fd982c14846755e7')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
