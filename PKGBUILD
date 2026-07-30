# Maintainer: Hedge-Ops Software <contact@hedge-ops.com>
# AUR PKGBUILD - downloads the pre-built CLI archive from GitHub releases.

pkgname=people-work
pkgver=2.0.22
pkgrel=1
pkgdesc="Manage your most important professional relationships"
arch=('x86_64')
url="https://people-work.io"
license=('custom:people-work')
depends=()
source=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/hedge-ops/people-work-releases/releases/download/v${pkgver}/${pkgname}-${pkgver}-x86_64.tar.gz")
sha256sums=('d3ba3c2688d5fb04df6d017052b79482814a6451b13fb4d9af35765f7f042b8d')

package() {
    install -Dm755 "${srcdir}/people" "${pkgdir}/usr/bin/people"
}

