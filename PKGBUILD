# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_es
_name=trytond_account_es
pkgver=5.8.2
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton with Spanish chart of accounts"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('efd3019f4eb3525fd5d30b5025ee74691d358d7fbd26c7fcb13b4292f91d1fb2')
sha512sums=('45041e74ddce5153efbe1cbaee83c4a2365a6209b62b4fbf7382fec5b820bdf7dde72deea31ce7015ef3da1d1b086e3d19d1585ab6cf8a70996ab366e7c4a246')
b2sums=('8c95cdaadfd045b919fbc8ad6870ec9904085d6b7c27977f9945d1a5b8a7b8d4afea32d9485ea9d69facf092eee2ef5da98c1147bf0558103ed21e02cd33c93e')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
