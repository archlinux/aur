# Maintainer: Benjamin Chabanne <benjamin(at)uvy(dot)fr>
# Contributor: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-oathkeeper'
pkgname="${_pkgname}-bin"
pkgver=0.39.4
pkgrel=1
pkgdesc="A cloud native Identity & Access Proxy (IAP) which authenticates and authorizes incoming HTTP requests."
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/oathkeeper/releases/download/v${pkgver//_/-}/oathkeeper_${pkgver//_/-}-linux_64bit.tar.gz")
sha256sums=('6f40566bc7a0d5da88bc4fdb8063dcad3fe47e07deff0f82a9959e0a2bbce057')

package() {
    install -m755 -D "${srcdir}/oathkeeper" "${pkgdir}/usr/bin/oathkeeper"
}
