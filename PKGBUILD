# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-kratos'
pkgname="${_pkgname}-bin"
pkgver=0.4.6_alpha.1
pkgrel=1
pkgdesc="A cloud native user management system."
arch=('x86_64')
url="https://ory.sh/kratos"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/kratos/releases/download/v${pkgver//_/-}/kratos_${pkgver//_/-}_linux_64bit.tar.gz")
sha256sums=('0c1f01df6bb49513af424b822744333b9f138fec7c96c1425d3a6685b2258444')

package() {
    install -m755 -D "${srcdir}/kratos" "${pkgdir}/usr/bin/kratos"
}
