# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-keto'
pkgname="${_pkgname}-bin"
pkgver=0.5.6_alpha.1
pkgrel=1
pkgdesc="A cloud native access control server"
arch=('x86_64')
url="https://ory.sh/keto"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/keto/releases/download/v${pkgver//_/-}/keto_${pkgver//_/-}_linux_64-bit.tar.gz")
sha256sums=('cc27f37e498336887e85fe6bd1b3ce75e93f5deddb7436e9fe1d983b4ade5844')

package() {
    install -m755 -D "${srcdir}/keto" "${pkgdir}/usr/bin/keto"
}
