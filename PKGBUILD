# Maintainer: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=snapd-fs
pkgver=0.0.0
pkgrel=0
pkgdesc="ln -s /var/lib/snapd/snap /snap"
arch=(any)
license=(MIT)
depends=(snapd)
source=(LICENSE.md)
sha512sums=(SKIP)

package() {
  ln -s /var/lib/snapd/snap "$pkgdir"/snap
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
