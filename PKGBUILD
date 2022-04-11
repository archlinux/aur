# Maintainer: Michael Beaumont <mjboamail@gmail.com>
_pkgname=kumactl
pkgname=${_pkgname}-bin
pkgver=1.6.0
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
  'fec8c80873700db4053f5a3a09c2600c794b35d272fbf4f18ed0e8358a065820'
)

package() {
  install -Dm755 "kuma-${pkgver}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
