# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=python-rplcd
_pkgname=RPLCD
pkgver=1.1.0
pkgrel=1
pkgdesc="LCD library for the widely used Hitachi HD44780 controller"
arch=(any)
url='https://github.com/dbrgn/RPLCD'
license=('MIT')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dbrgn/RPLCD/archive/v${pkgver}.tar.gz")
sha512sums=('5bc9e3cb3bc291ab5e4854e0904db909230e9271bb4e521d8f0cc1c2f4db078af3d84097114ca026a6ae03c611b0301bfdebfe6ed7bb38be965dbe53ac0c30f6')

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
