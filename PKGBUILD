# Maintainer: Hedge-Ops Software <contact@hedge-ops.com>
# AUR PKGBUILD - downloads the pre-built CLI archive from GitHub releases.

pkgname=people-work
pkgver=2.0.4
pkgrel=1
pkgdesc="Manage your most important professional relationships"
arch=('x86_64')
url="https://people-work.io"
license=('custom:people-work')
depends=()
source=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/hedge-ops/people-work-releases/releases/download/v${pkgver}/${pkgname}-${pkgver}-x86_64.tar.gz")
sha256sums=('548b6ce466b88c74d5d5cd7e3ac03b315a4064196b17f41e42b87b63053a8ae8')

package() {
    install -Dm755 "${srcdir}/people" "${pkgdir}/usr/bin/people"
}

