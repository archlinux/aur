# Maintainer: Benjamin Chabanne <benjamin(at)uvy(dot)fr>
# Contributor: Matthew Ellison <seglberg+aur(at)gmail(dot)com>

_pkgname='ory-hydra'
pkgname="${_pkgname}-bin"
pkgver=1.11.10
pkgrel=1
pkgdesc="OAuth 2.0 and OpenID Connect Provider"
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/hydra/releases/download/v${pkgver//_/-}/hydra_${pkgver//_/-}-linux_64bit.tar.gz")
sha256sums=('8dd4b4619862557162eb95eaac8bc9f5d8ee14c74e4996dfec3d5040a10b9977')

package() {
    install -m755 -D "${srcdir}/hydra" "${pkgdir}/usr/bin/hydra"
}
