# Maintainer: Michael Beaumont <mjboamail@gmail.com>
_pkgname=kumactl
pkgname=${_pkgname}-bin
pkgver=1.4.1
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
  'a1e15a826c1b2541d76278b2a747c073f7086759906ebf801352c3c5bd817449'
)

package() {
  install -Dm755 "kuma-${pkgver}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
