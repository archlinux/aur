# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_cash_rounding
_name=trytond_account_cash_rounding
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to round cash amount"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('80953f5d06bc43c590852527e55a0fd569a925d580083d797afb1853d18ef41d')
sha512sums=('681c4ba17ff95fb5dfa5a3e5407c861af991b9e87b2f5f180439df260ed392a5d0d916065635a0361426d52bab19730b7a0723c76b4ebcec50c56d80909984be')
b2sums=('dddf6cd80dd98dbb5c8381b9994747bac9254a91d6e4f2a68382a88858f7add40b8a32df4a4c50a564e1b93213df15521b798353f29f8810ea1c0c2a5b93db77')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
