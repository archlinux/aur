# Maintainer: Benjamin Chabanne <benjamin(at)uvy(dot)fr>
# Contributor: Matthew Ellison <seglberg+aur(at)gmail(dot)com>

_pkgname='ory-hydra'
pkgname="${_pkgname}-bin"
pkgver=2.0.2
pkgrel=1
pkgdesc="OAuth 2.0 and OpenID Connect Provider"
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/hydra/releases/download/v${pkgver//_/-}/hydra_${pkgver//_/-}-linux_64bit.tar.gz")
sha256sums=('6e45184f2b19c6b69a400ca8ec331a1753c9659c432c8e342171dde064e1e750')

package() {
    install -m755 -D "${srcdir}/hydra" "${pkgdir}/usr/bin/hydra"
}
