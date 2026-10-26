# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=nouveau-utils
pkgver=2.2.1
pkgrel=1
pkgdesc="Userspace dynamic frequency governor, CLI management tool, and interactive TUI for Nouveau"
arch=('any')
url="https://github.com/Twilight0/nouveau-utils"
license=('GPL-2.0-only')
depends=('python' 'nouveau-dkms')
provides=('nouveau-utils')
backup=('etc/nouveau-dynclockd.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Twilight0/nouveau-utils/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bf0edaf8f1ef3ad4cf71342d9d1f7d01664db26765ec4301b0747283eec30335')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
