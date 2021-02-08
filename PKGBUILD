# Maintainer: Matthew Ellison <seglberg+aur(at)gmail(dot)com>

_pkgname='ory-hydra'
pkgname="${_pkgname}-bin"
pkgver=1.9.2
pkgrel=1
pkgdesc="OAuth 2.0 and OpenID Connect Provider"
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/hydra/releases/download/v${pkgver//_/-}/hydra_${pkgver//_/-}_linux_64bit.tar.gz")
sha256sums=('bd919a7dadd87ebabbf11c457f0b4d172e8ea4281b0932f8cc477560890d327c')

package() {
    install -m755 -D "${srcdir}/hydra" "${pkgdir}/usr/bin/hydra"
}
