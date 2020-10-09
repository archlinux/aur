# Maintainer: Matthew Ellison <matt(at)arroyo(dot)io>

_pkgname='ory-hydra'
pkgname="${_pkgname}-bin"
pkgver=1.8.5
pkgrel=1
pkgdesc="OAuth 2.0 and OpenID Connect Provider"
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/hydra/releases/download/v${pkgver//_/-}/hydra_${pkgver//_/-}_linux_64-bit.tar.gz")
sha256sums=('4787711c2f758e53219d62da433c7a80f08cfa9127dd82cf4284dd43f2b5f959')

package() {
    install -m755 -D "${srcdir}/hydra" "${pkgdir}/usr/bin/hydra"
}
