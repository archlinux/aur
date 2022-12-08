# Maintainer: Michael Beaumont <mjboamail@gmail.com>
_pkgname=kumactl
pkgname=${_pkgname}-bin
pkgver=2.0.1
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
  'c7ec6a998ddb68f2134bfc202015a20dca9cbf6ef346418a4c8c12a1f180b56a'
)

package() {
  install -Dm755 "kuma-${pkgver}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
