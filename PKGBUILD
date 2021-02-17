# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_commission_waiting
_name=trytond_commission_waiting
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module for commission waiting"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a1f3a46b9d547bbfc77d5b72707a7e9ba8bbede5df0193070807ca72c1f2195c')
sha512sums=('9581aa4c22be38bfc7a9ca27a4df0f20e121f547d0eee7410d94cc34459c516bb64ad68043b582010d0a74d14e713713e95c1986fd4729537bb707686de06b8a')
b2sums=('7887d1ef52257e404dc1d6fcd1d98d4c3015be00a08d4e33ab62fbe4b4e3f31df378e29d12860ab44491b4d9a13242c806e6e4e4ca4da0f7d78c203fa12f4511')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
