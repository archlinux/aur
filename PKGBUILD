# Maintainer: KADHIRAVANEG <kadhiravanegk@gmail.com>
pkgname=nodewipe-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Find and reclaim disk space from stray dev artifacts (node_modules, Python venvs, Rust/Java/JS build caches, and more)"
arch=('x86_64')
url="https://github.com/KADHIRAVANEG/nodewipe"
license=('MIT')
provides=('nodewipe')
conflicts=('nodewipe')
source=("nodewipe-${pkgver}::https://github.com/KADHIRAVANEG/nodewipe/releases/download/v${pkgver}/nodewipe-linux-x86_64")
sha256sums=('8ead41d56f71221a3bb3b3d1ceb65484a69d557bcce798766497124ccb5c4603')

package() {
    install -Dm755 "${srcdir}/nodewipe-${pkgver}" "${pkgdir}/usr/bin/nodewipe"
}
