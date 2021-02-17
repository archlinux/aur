# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_dunning_letter
_name=trytond_account_dunning_letter
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for account dunning letter"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('76019f2f1773ecdadc18859676df01ca7fcbbdd734a358ee20936adba1ad0ab0')
sha512sums=('642dfbfb985a0af117c5a2174fffc4dc566542f128323d3687458791c6b5436bfa8e0d8122ae205df305bdbfd70ab60a34966e9ffe8457abfd68ef8589110303')
b2sums=('8e8da7988607283796d053ff510332a9547b55eaec373354dc2bcafd593188dccd44f90b9f816edc389aa60cbf207c12252c175ae3a9e363f915a4a98a1156c9')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
