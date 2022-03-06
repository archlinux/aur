# Maintainer: Benjamin Chabanne <benjamin(at)uvy(dot)fr>
# Contributor: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-oathkeeper'
pkgname="${_pkgname}-bin"
pkgver=0.38.23_beta.1
pkgrel=1
pkgdesc="A cloud native Identity & Access Proxy (IAP) which authenticates and authorizes incoming HTTP requests."
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/oathkeeper/releases/download/v${pkgver//_/-}/oathkeeper_${pkgver//_/-}-linux_64bit.tar.gz")
sha256sums=('f5a23da97eaf2317db9d909351f0a9a75d26d739a8e57cc4e8469ac1b45943ec')

package() {
    install -m755 -D "${srcdir}/oathkeeper" "${pkgdir}/usr/bin/oathkeeper"
}
