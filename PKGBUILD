# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-kratos'
pkgname="${_pkgname}-bin"
pkgver=0.5.5_alpha.1
pkgrel=1
pkgdesc="A cloud native user management system."
arch=('x86_64')
url="https://ory.sh/kratos"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/kratos/releases/download/v${pkgver//_/-}/kratos_${pkgver//_/-}_linux_64bit.tar.gz")
sha256sums=('63b91380f460d74d291a34de319ce37b6f2ae1c495da2d51e160eb4c203f8147')

package() {
    install -m755 -D "${srcdir}/kratos" "${pkgdir}/usr/bin/kratos"
}
