# Maintainer: Benjamin Chabanne <benjamin(at)uvy(dot)fr>
# Contributor: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-keto'
pkgname="${_pkgname}-bin"
pkgver=0.8.0_alpha.2
pkgrel=1
pkgdesc="A cloud native access control server"
arch=('x86_64')
url="https://ory.sh/keto"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/keto/releases/download/v${pkgver//_/-}/keto_${pkgver//_/-}-linux_64bit.tar.gz")
sha256sums=('49660aa6b61d6a6ff88307463b16f302729b4dc053778b3a0a0c448cf56e3bec')

package() {
    install -m755 -D "${srcdir}/keto" "${pkgdir}/usr/bin/keto"
}
