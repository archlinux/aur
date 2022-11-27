# Maintainer: Benjamin Chabanne <benjamin(at)uvy(dot)fr>
# Contributor: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-oathkeeper'
pkgname="${_pkgname}-bin"
pkgver=0.40.0
pkgrel=1
pkgdesc="A cloud native Identity & Access Proxy (IAP) which authenticates and authorizes incoming HTTP requests."
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/oathkeeper/releases/download/v${pkgver//_/-}/oathkeeper_${pkgver//_/-}-linux_64bit.tar.gz")
sha256sums=('379c27114dfe7c4a30f96d10c5bfdf01e6fd977f207dd7ab585780a1d6fc1ee3')

package() {
    install -m755 -D "${srcdir}/oathkeeper" "${pkgdir}/usr/bin/oathkeeper"
}
