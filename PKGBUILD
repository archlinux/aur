# Maintainer: Benjamin Chabanne <benjamin(at)uvy(dot)fr>
# Contributor: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-kratos'
pkgname="${_pkgname}-bin"
pkgver=0.9.0_alpha.3
pkgrel=1
pkgdesc="A cloud native user management system."
arch=('x86_64')
url="https://ory.sh/kratos"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/kratos/releases/download/v${pkgver//_/-}/kratos_${pkgver//_/-}-linux_64bit.tar.gz")
sha256sums=('b80e32fe93ced9d8e1c0e4afd05262832872f1612a0da5dc48603818b3157218')

package() {
    install -m755 -D "${srcdir}/kratos" "${pkgdir}/usr/bin/kratos"
}
