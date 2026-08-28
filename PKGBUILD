# Maintainer: Hedge-Ops Software <contact@hedge-ops.com>
# AUR PKGBUILD - downloads the pre-built CLI archive from GitHub releases.

pkgname=people-work
pkgver=2.0.39
pkgrel=1
pkgdesc="Manage your most important professional relationships"
arch=('x86_64')
url="https://people-work.io"
license=('custom:people-work')
depends=()
source=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/hedge-ops/people-work-releases/releases/download/v${pkgver}/${pkgname}-${pkgver}-x86_64.tar.gz")
sha256sums=('defd5543137aec3b8e063bb40ce86dfc491f7b6b040fe719c4909ce2d1bdb093')

package() {
    install -Dm755 "${srcdir}/people" "${pkgdir}/usr/bin/people"
}

