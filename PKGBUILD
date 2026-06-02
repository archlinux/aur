# Maintainer: Natalie Spiva <natalie@acreetionos.org>
# Binary package — downloads pre-built releases from GitHub.
# Source builds are available in the acreetionos-mediawriter-git package.

pkgname=acreetionos-mediawriter-bin
pkgver=5.3.1
pkgrel=1
pkgdesc="AcreetionOS USB Flasher — Write AcreetionOS images to USB drives (binary)"
arch=('x86_64')
url="https://github.com/spivanatalie64/AcreetionMediaWriter"
license=('GPL2')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'xz'
  'glibc'
  'hicolor-icon-theme'
)
optdepends=(
  'polkit: Authorization for writing to disks'
  'udisks2: Disk Management Service for disk installation'
)
provides=('acreetionos-mediawriter')
conflicts=('acreetionos-mediawriter')
source=("https://github.com/spivanatalie64/AcreetionMediaWriter/releases/download/${pkgver}/AcreetionOSMediaWriter-linux-x86_64-${pkgver}.pkg.tar.zst")
sha256sums=('SKIP')

package() {
  tar -xf "${srcdir}/AcreetionOSMediaWriter-linux-x86_64-${pkgver}.pkg.tar.zst" -C "${pkgdir}"
}
