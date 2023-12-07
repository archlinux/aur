# Maintainer:  dreieck


_pkgname=wakeup-triggers
pkgname="${_pkgname}-openrc"

pkgver=20231207.01
pkgrel=1
pkgdesc="OpenRC init script to run 'wakeup-triggers.sh' at boot."
arch=(
  'any'
)
url="https://aur.archlinux.org/packages/${pkgname}"
license=('GPL3')
depends=(
  'wakeup-triggers'
)
makedepends=()
optdepends=(
  'openrc: To make use of this init script.'
)
provides=()
conflicts=()
source=(
  'wakeup-triggers.openrc'
)
sha256sums=(
  'f73d8c67f985e9257194651693b5162e812c38f6c3330db1b81e1993e54d34ae'
)

package() {
  install -Dvm755 "${srcdir}/wakeup-triggers.openrc" "${pkgdir}/etc/init.d/wakeup-triggers"
}
