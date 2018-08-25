# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=python-pad4pi
_pkgname=pad4pi
pkgver=1.1.5
pkgrel=1
pkgdesc="Interrupt-based matrix keypad library for Raspberry Pi"
arch=(any)
url='https://github.com/brettmclean/pad4pi'
license=('LGPLV3')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/brettmclean/pad4pi/archive/${pkgver}.tar.gz")
sha512sums=('8322965984cccdc50e320789319b4de113ece56aee09641a7c55a859f671f96dd1023d642ac61296a24f73fd0e40c69a7a577f336125a022ab019d56c1457144')

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
