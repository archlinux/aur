# Maintainer: KADHIRAVANEG <kadhiravanegk@gmail.com>
pkgname=nodewipe
pkgver=0.6.0
pkgrel=1
pkgdesc="Find and reclaim disk space from stray dev artifacts (node_modules, Python venvs, Rust/Java/JS build caches, and more)"
arch=('x86_64')
url="https://github.com/KADHIRAVANEG/nodewipe"
license=('MIT')
provides=('nodewipe')
conflicts=('nodewipe-bin')
source=("nodewipe-${pkgver}::https://github.com/KADHIRAVANEG/nodewipe/releases/download/v${pkgver}/nodewipe-linux-x86_64")
sha256sums=('d941001b9d124946c5fdc51cd944867d8048bc05d6480e83002cd24092d3389d')

package() {
    install -Dm755 "${srcdir}/nodewipe-${pkgver}" "${pkgdir}/usr/bin/nodewipe"
}
