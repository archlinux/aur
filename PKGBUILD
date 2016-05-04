# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=sanoid
pkgver=1.0.8
pkgrel=1
pkgdesc="Sanoid is a policy-driven snapshot management tool for ZFS filesystems."
arch=('any')
url='https://github.com/jimsalterjrs/sanoid'
license=('GPL')
depends=('perl')
conflicts=('sanoid-git')
provides=('sanoid')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jimsalterjrs/sanoid/archive/v$pkgver.tar.gz")
sha256sums=('fb6187c010b71bfd2114663370bdb29a26f123299f5a424d3e9a21e21b6f7388')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sanoid/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/sanoid/LICENSE"
  install -Dm644 sanoid.conf "${pkgdir}/etc/sandoid/sanoid.conf"
  install -Dm755 sanoid "${pkgdir}/usr/bin/sanoid"
  install -Dm755 syncoid "${pkgdir}/usr/bin/syncoid"
}
