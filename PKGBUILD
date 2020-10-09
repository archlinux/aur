# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-oathkeeper'
pkgname="${_pkgname}-bin"
pkgver=0.38.4_beta.1
pkgrel=1
pkgdesc="A cloud native Identity & Access Proxy (IAP) which authenticates and authorizes incoming HTTP requests."
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/oathkeeper/releases/download/v${pkgver//_/-}/oathkeeper_${pkgver//_/-}_linux_64-bit.tar.gz")
sha256sums=('2c8bb66c5c6798cd6cfe2fef1766527350e06b7db3da3eb5794910adc122051d')

package() {
    install -m755 -D "${srcdir}/oathkeeper" "${pkgdir}/usr/bin/oathkeeper"
}
