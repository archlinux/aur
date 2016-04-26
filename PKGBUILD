# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=python-vk
pkgver=2.0
pkgrel=1
pkgdesc='A Python wrapper around the VK.com/VKontakte.ru API.'
arch=('any')
url="https://github.com/dimka665/vk"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dimka665/vk/archive/${pkgver}.tar.gz")
sha256sums=('5401c806120350d7c28010a62c5e55240b0016af04163b714307b952ad3dab0c')

package() {
  cd "$srcdir/vk-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}
