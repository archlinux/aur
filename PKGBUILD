# Maintainer: Benjamin Chabanne <benjamin(at)uvy(dot)fr>
# Contributor: Matthew Ellison <seglberg+aur(at)gmail(dot)com>

_pkgname='ory-hydra'
pkgname="${_pkgname}-bin"
pkgver=1.11.7
pkgrel=1
pkgdesc="OAuth 2.0 and OpenID Connect Provider"
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/hydra/releases/download/v${pkgver//_/-}/hydra_${pkgver//_/-}-linux_64bit.tar.gz")
sha256sums=('98f0f4e6a5f97960fe2a697a69d62d2461714b9f64c457ca15a11769af44bb35')

package() {
    install -m755 -D "${srcdir}/hydra" "${pkgdir}/usr/bin/hydra"
}
