# Maintainer: Benjamin Chabanne <benjamin(at)uvy(dot)fr>
# Contributor: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-kratos'
pkgname="${_pkgname}-bin"
pkgver=0.8.2_alpha.1
pkgrel=1
pkgdesc="A cloud native user management system."
arch=('x86_64')
url="https://ory.sh/kratos"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/kratos/releases/download/v${pkgver//_/-}/kratos_${pkgver//_/-}-linux_64bit.tar.gz")
sha256sums=('2d72f8e50c177dc03a350f143ad08ded6627e3052acece47a996ddf1d7b2f8da')

package() {
    install -m755 -D "${srcdir}/kratos" "${pkgdir}/usr/bin/kratos"
}
