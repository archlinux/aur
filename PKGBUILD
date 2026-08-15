# Maintainer: Hedge-Ops Software <contact@hedge-ops.com>
# AUR PKGBUILD - downloads the pre-built CLI archive from GitHub releases.

pkgname=people-work
pkgver=2.0.32
pkgrel=1
pkgdesc="Manage your most important professional relationships"
arch=('x86_64')
url="https://people-work.io"
license=('custom:people-work')
depends=()
source=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/hedge-ops/people-work-releases/releases/download/v${pkgver}/${pkgname}-${pkgver}-x86_64.tar.gz")
sha256sums=('a91d9c196b9388c8c1e12be2b63fdb2203ffda5eab3059f97fbbd8dbb7d1e4ff')

package() {
    install -Dm755 "${srcdir}/people" "${pkgdir}/usr/bin/people"
}

