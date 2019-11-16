# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=python-rplcd
_pkgname=RPLCD
pkgver=1.2.2
pkgrel=1
pkgdesc="LCD library for the widely used Hitachi HD44780 controller"
arch=(any)
url='https://github.com/dbrgn/RPLCD'
license=('MIT')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dbrgn/RPLCD/archive/v${pkgver}.tar.gz")
sha512sums=('9a5c223cb990e1e20cd2b86e23a49fd1b99b24809163b769bd20c35c1a9b7c8398d725fe9275f27787ec9210b7d415bbae4a31b1c6d1595bb636132b0ca97a1e')

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
