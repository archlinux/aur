# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_statement_aeb43
_name=trytond_account_statement_aeb43
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to import AEB43 statements"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f7146dd9147f1862561c1a71fe282ed774bde79d6174d7884c07cd522abe3329')
sha512sums=('68bc99b893954f77ed25ddceb884515338322d45006f377f1295e24fd7662afe6915f5e4a2f1de085dd49fa6faab452270a891a9ec73f14e4fca1a08d66d496e')
b2sums=('63918ab4c49e43f34129bbb0d988d14e937ca1486fd0ff78e1aa8a5509b9ecb8b8477ad68262f43285d26f27676689817972ad773f3bac9866a2129348d3de35')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
