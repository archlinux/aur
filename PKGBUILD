# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_dunning_fee
_name=trytond_account_dunning_fee
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for account dunning fee"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4affc733e62aac62ee04131b48f8a3aed78ffe4f9e4874b6a4ff27f255393c9c')
sha512sums=('c5e772125af44eff669a126a02911867969edae8bc904ddc8519edc64b7b4576deceaa53ce577336293f3da9a1b5715ae2a6ce681ea56b0209434a8a44a6a585')
b2sums=('e0b007e0e9b9bb67a0d8b3ee87745cef29e5ec89d29c17eeca07c45f0466a58474dbbbc1078c8d34daf02e7028869ea6f9ba21b7b04daacb7f6efdc118af8ce1')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
