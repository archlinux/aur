# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=nouveau-utils
pkgver=2.2.0
pkgrel=1
pkgdesc="Userspace dynamic frequency governor, CLI management tool, and interactive TUI for Nouveau"
arch=('any')
url="https://github.com/Twilight0/nouveau-utils"
license=('GPL-2.0-only')
depends=('python' 'nouveau-dkms')
provides=('nouveau-utils')
backup=('etc/nouveau-dynclockd.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Twilight0/nouveau-utils/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('41e6cfdccb394024e75a8871971ac34e93791bd30d884e211ed2d7be4e2831c2')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
