# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=python-rplcd
_pkgname=RPLCD
pkgver=1.3.0
pkgrel=1
pkgdesc="LCD library for the widely used Hitachi HD44780 controller"
arch=(any)
url='https://github.com/dbrgn/RPLCD'
license=('MIT')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dbrgn/RPLCD/archive/v${pkgver}.tar.gz")
sha512sums=('61df660c76ef20798c23bdca75bc73c9af4bef03aca8d45cad02fb3527da0478b1932fa37a5f6c8f7218d5adc62a4dbf49a8f75801ba12cca9362797c9cb72d8')

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
