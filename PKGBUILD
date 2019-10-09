# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-hydra'
pkgname="${_pkgname}-bin"
pkgver=1.0.8
pkgrel=1
pkgdesc="OAuth 2.0 and OpenID Connect Provider"
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/hydra/releases/download/v${pkgver//_/-}/hydra_${pkgver//_/-}_Linux_64-bit.tar.gz")
sha256sums=('b43655ca0728a44b84734d74a8d5ae33b7bd0b233e62ef8878d948ca1c9bb0b8')

package() {
    install -m755 -D "${srcdir}/hydra" "${pkgdir}/usr/bin/hydra"
}
