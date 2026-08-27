# Maintainer: KADHIRAVANEG <kadhiravanegk@gmail.com>
pkgname=nodewipe
pkgver=0.5.1
pkgrel=1
pkgdesc="Find and reclaim disk space from stray dev artifacts (node_modules, Python venvs, Rust/Java/JS build caches, and more)"
arch=('x86_64')
url="https://github.com/KADHIRAVANEG/nodewipe"
license=('MIT')
provides=('nodewipe')
conflicts=('nodewipe-bin')
source=("nodewipe-${pkgver}::https://github.com/KADHIRAVANEG/nodewipe/releases/download/v${pkgver}/nodewipe-linux-x86_64")
sha256sums=('0867952c520d562334d5e6ff8c6564a5b0dd15b2f8451a5088374aefcb29335c')

package() {
    install -Dm755 "${srcdir}/nodewipe-${pkgver}" "${pkgdir}/usr/bin/nodewipe"
}
