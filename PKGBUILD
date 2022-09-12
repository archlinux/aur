# Maintainer: Benjamin Chabanne <benjamin(at)uvy(dot)fr>
# Contributor: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-kratos'
pkgname="${_pkgname}-bin"
pkgver=0.10.1
pkgrel=1
pkgdesc="A cloud native user management system."
arch=('x86_64')
url="https://ory.sh/kratos"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/kratos/releases/download/v${pkgver//_/-}/kratos_${pkgver//_/-}-linux_64bit.tar.gz")
sha256sums=('9c65f628aee2b66abe4e3058673b6b56b6cce76a4cc112145527acb21e8d60c7')

package() {
    install -m755 -D "${srcdir}/kratos" "${pkgdir}/usr/bin/kratos"
}
