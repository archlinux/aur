# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=sanoid-git
pkgver=1
pkgrel=1
pkgdesc="Sanoid is a policy-driven snapshot management tool for ZFS filesystems."
arch=('any')
url='https://github.com/jimsalterjrs/sanoid'
license=('GPL')
conflicts=('sanoid')
provides=('sanoid')
source=("sanoid-git::git+https://github.com/jimsalterjrs/sanoid.git")
sha256sums=('SKIP')

package() {
  cd "${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/sanoid/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/sanoid/LICENSE"
  install -Dm644 sanoid.conf "${pkgdir}/etc/sandoid/sanoid.conf"
  install -Dm755 sanoid "${pkgdir}/usr/bin/sanoid"
  install -Dm755 syncoid "${pkgdir}/usr/bin/syncoid"
}
