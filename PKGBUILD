# Maintainer: Michael Beaumont <mjboamail@gmail.com>
_pkgname=kumactl
pkgname=${_pkgname}-bin
pkgver=1.8.1
pkgrel=1
pkgdesc="CLI for Kuma, the universal Envoy service mesh"
arch=('x86_64')
url="https://github.com/kumahq/kuma"
depends=()
license=('Apache')
provides=('kumactl')
source=(
  "${_pkgname}-${pkgver}::https://download.konghq.com/mesh-alpine/kuma-${pkgver}-debian-amd64.tar.gz"
)
sha256sums=(
  '31ef6733aa8c8eac2f9443455a098f642cc43f85bdbd0d39af26042d0e649c98'
)

package() {
  install -Dm755 "kuma-${pkgver}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
