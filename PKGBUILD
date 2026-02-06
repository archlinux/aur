# Maintainer: Hedge-Ops Software <contact@hedge-ops.com>
# AUR PKGBUILD - downloads pre-built binary from GitHub releases

pkgname=people-work
pkgver=1.3.0
pkgrel=1
pkgdesc="Manage your most important professional relationships"
arch=('x86_64')
url="https://people-work.io"
license=('custom:people-work')
depends=()
source=("${pkgname}-${pkgver}.pkg.tar.zst::https://github.com/hedge-ops/people-work-releases/releases/download/v${pkgver}/${pkgname}-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('SKIP')
noextract=("${pkgname}-${pkgver}.pkg.tar.zst")

package() {
    tar -xf "${srcdir}/${pkgname}-${pkgver}.pkg.tar.zst" -C "${pkgdir}"
}
