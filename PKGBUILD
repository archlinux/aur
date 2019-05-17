# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-hydra'
pkgname="${_pkgname}-bin"
pkgver=1.0.0_rc.12
pkgrel=1
pkgdesc="ORY Hydra is a hardened, certified OAuth2 and OpenID Connect server optimized for low-latency, high throughput, and low resource consumption."
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/hydra/releases/download/v${pkgver//_/-}/hydra_${pkgver//_/-}_Linux_64-bit.tar.gz")
sha256sums=('6d93d74a7daa8b1b08e2a35ef6e07cf7fc7c403a2d63ad016291a7a41404d63f')

package() {
    install -m755 -D "${srcdir}/hydra" "${pkgdir}/usr/bin/hydra"
}
