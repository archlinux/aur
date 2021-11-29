# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=aurbuild
pkgdesc="Collection of scripts to build and release packages from 'aur shaped' repositories"
pkgver=1.0.0
pkgrel=1
arch=("any")
url="https://github.com/vbouchaud/aur/tree/main/aurbuild"
license=("MIT")

sha256sums=(
    "1393bc3df151942d373be3ef188f0d3cdf7c6ee538a38cd1a3b286ac9b784594"
)

source=(
    "aurbuild"
)

package() {
    install -D -m0755 "${srcdir}/aurbuild" "${pkgdir}/usr/bin/aurbuild"
}
