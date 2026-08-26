# Maintainer: KADHIRAVANEG <kadhiravanegk@gmail.com>
pkgname=nodewipe
pkgver=0.5.0
pkgrel=1
pkgdesc="Find and reclaim disk space from stray dev artifacts (node_modules, Python venvs, Rust/Java/JS build caches, and more)"
arch=('x86_64')
url="https://github.com/KADHIRAVANEG/nodewipe"
license=('MIT')
provides=('nodewipe')
conflicts=('nodewipe-bin')
source=("nodewipe-${pkgver}::https://github.com/KADHIRAVANEG/nodewipe/releases/download/v${pkgver}/nodewipe-linux-x86_64")
sha256sums=('a7386034d8fdac617ba7f03d5a65b82734bc83f382a1fc911f3fdd9772f304ea')

package() {
    install -Dm755 "${srcdir}/nodewipe-${pkgver}" "${pkgdir}/usr/bin/nodewipe"
}
