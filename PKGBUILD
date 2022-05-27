# Maintainer: Michael Beaumont <mjboamail@gmail.com>
_pkgname=kumactl
pkgname=${_pkgname}-bin
pkgver=1.6.0
pkgrel=2
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
  'c6faa0ec1933b97ba74c2b3beca1f09075d6f2bd917085144dfdf4eb6d26cd41'
)

package() {
  install -Dm755 "kuma-${pkgver}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
