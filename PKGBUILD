# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_fr_chorus
_name=trytond_account_fr_chorus
pkgver=5.6.0
_pkgdir=5.6
pkgrel=1
pkgbase=python-$_name
pkgdesc=""
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.5')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f8d20f7dc1b35a9e824c475f41e13120a465b8bf6ca3d1b98b269587cfd26d81')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
