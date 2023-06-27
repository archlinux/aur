# Maintainer: Michael Beaumont <mjboamail@gmail.com>
_pkgname=kumactl
pkgname=${_pkgname}-bin
pkgver=2.3.0
pkgrel=1
pkgdesc="CLI for Kuma, the universal Envoy service mesh"
arch=('x86_64')
url="https://github.com/kumahq/kuma"
depends=()
license=('Apache')
provides=('kumactl')
source=(
  "${_pkgname}-${pkgver}::https://download.konghq.com/kuma-binaries-release/kuma-${pkgver}-linux-amd64.tar.gz"
)
sha256sums=(
  'b78430299ad0c992351ecb96a07350e9e9f1c0fbd5b4a7ff3e048e16259ad191'
)

package() {
  install -Dm755 "kuma-${pkgver}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
