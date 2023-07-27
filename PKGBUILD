# Maintainer: Arturo Penen <apenen@gmail.com>

pkgname=python-console-menu
_pkgname='console-menu'
pkgver=0.8.0
pkgrel=1
pkgdesc='A simple Python menu system for building terminal user interfaces.'
arch=('any')
url='https://github.com/aegirhall/console-menu'
license=('MIT')
depends=('python' 'python-jose' 'python-requests')
makedepends=('git' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aegirhall/console-menu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a178e43701cb046455ae405bfcd156ca6b0acc36c19004e8849967bc666633d1')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
