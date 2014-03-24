# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=gtimelog
pkgver=0.9.1
pkgrel=2
pkgdesc='Small GTK+ app for keeping track of your time'
arch=('any')
url='http://mg.pov.lt/gtimelog/'
license=('GPL')
depends=('python' 'python-gobject' 'python-setuptools')
source=(http://pypi.python.org/packages/source/g/$pkgname/$pkgname-${pkgver}.tar.gz)
md5sums=('5e95d0e968ad24778e0ae9fee748d73f')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir"
}
