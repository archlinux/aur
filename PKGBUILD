# Maintainer: Aleksander Clark <alex at alexclark dot sh>
pkgname=xcrush-bin
pkgver=2026.01.30.1
pkgrel=1
pkgdesc="⚠️  UNOFFICIAL TOOL - Build tool for creating custom Crush distributions (NOT an official Charm Labs tool)"
arch=('x86_64')
url="https://github.com/aleksclark/crush-modules"
license=('MIT')
provides=('xcrush')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/xcrush_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    
    # Install binary
    install -Dm755 "xcrush" "${pkgdir}/usr/bin/xcrush"
    
    # Install license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
