# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pkgbase="gpdfanspeed"
pkgbase="${_pkgbase}"
_pkgname="${_pkgbase}"
pkgname="${pkgbase}"
groups=(
  "gpd"
)
_gpdfanspeedver="$("${startdir}"/gpdfanspeed --version)"
pkgver="${_gpdfanspeedver}"
pkgrel=1
pkgdesc="Command line utility for kernel fan driver hwmon interface for GPD Win Mini, GPD Win Max2 and GPD Win 4 laptops."
#url="https://github.com/Cryolitia/gpd-fan-driver"
url="https://aur.archlinux.org/packages/gpdfanspeed"
arch=('any')
license=('GPL-2.0-or-later')
depends=(
  'bash'
)
makedepends=()
optdepends=(
  "GPD-FAN-DRIVER: For kernel support (kernel packages might still support this without having 'GPD-FAN-DRIVER' in their 'provides' array, though.)"
)
provides=()
conflicts=()
source=(
  "gpdfanspeed"
)
sha256sums=(
  '3036d557eb03beb15e2a6b5fbe5d6af98945fb2cec34aa735f544164217fa203'  # gpdfanspeed
)

package() {
  install -Dvm755 -t "${pkgdir}/usr/bin"  "${srcdir}/gpdfanspeed"
}
