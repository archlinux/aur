# Maintainer: Hedge-Ops Software <contact@hedge-ops.com>
# AUR PKGBUILD - downloads pre-built binary from GitHub releases

pkgname=people-work
pkgver=1.4.18
pkgrel=1
pkgdesc="Manage your most important professional relationships"
arch=('x86_64')
url="https://people-work.io"
license=('custom:people-work')
depends=()
source=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/hedge-ops/people-work-releases/releases/download/v${pkgver}/${pkgname}-${pkgver}-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/people" "${pkgdir}/usr/bin/people"
}
