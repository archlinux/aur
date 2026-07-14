# Maintainer: KADHIRAVANEG <kadhiravanegk@gmail.com>
pkgname=nodewipe-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Find and reclaim disk space from stray dev artifacts (node_modules, Python venvs, Rust/Java/JS build caches, and more)"
arch=('x86_64')
url="https://github.com/KADHIRAVANEG/nodewipe"
license=('MIT')
provides=('nodewipe')
conflicts=('nodewipe')
source=("nodewipe-${pkgver}::https://github.com/KADHIRAVANEG/nodewipe/releases/download/v${pkgver}/nodewipe-linux-x86_64")
sha256sums=('2f673aab4578e99e0cd35adccc6e6beec1110e92a5a790834d223f9374ca948b')

package() {
    install -Dm755 "${srcdir}/nodewipe-${pkgver}" "${pkgdir}/usr/bin/nodewipe"
}
