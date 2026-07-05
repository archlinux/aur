# Maintainer: Hedge-Ops Software <contact@hedge-ops.com>
# AUR PKGBUILD - downloads the pre-built CLI archive from GitHub releases.

pkgname=people-work
pkgver=2.0.11
pkgrel=1
pkgdesc="Manage your most important professional relationships"
arch=('x86_64')
url="https://people-work.io"
license=('custom:people-work')
depends=()
source=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/hedge-ops/people-work-releases/releases/download/v${pkgver}/${pkgname}-${pkgver}-x86_64.tar.gz")
sha256sums=('9b42356a2c25bc3a8549606fe5bdadc20fffc279c51e28524d594a5303afac12')

package() {
    install -Dm755 "${srcdir}/people" "${pkgdir}/usr/bin/people"
}

