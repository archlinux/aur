# Maintainer: dreieck

# On 2026-09-24, taken from https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/testing/ipp-usb/ipp-usb.initd

_pkgbase="ipp-usb-openrc"
pkgbase="${_pkgbase}"
pkgname=("ipp-usb-openrc")
epoch=0
pkgver=0.5
pkgrel=1
pkgdesc="OpenRc init script for 'ipp-usb'."
arch=(
  'any'
)
url="https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/testing/ipp-usb/ipp-usb.initd"
license=('BSD-2-Clause')
depends=(
  'ipp-usb'
)
optdepends=(
  'openrc: To make use of the OpenRC initscript.'
)
makedepends=()
source=(
  'ipp-usb.initd'
)
sha256sums=(
  '106e551e94686d32c9bfde468d1c3262d3b4715a011b932182c9ed26402bcff3'
)

package_ipp-usb-openrc() {

  install -Dvm755 "${srcdir}/ipp-usb.initd" "${pkgdir}/etc/init.d/ipp-usb"
}
