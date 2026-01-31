# Maintainer: Aleksander Clark <alex at alexclark dot sh>
pkgname=crush-extended-bin
pkgver=2026.01.30.1
pkgrel=1
pkgdesc="⚠️  UNOFFICIAL BUILD - Crush AI assistant with community plugins (NOT an official Charm Labs release)"
arch=('x86_64')
url="https://github.com/aleksclark/crush-modules"
license=('MIT')
provides=('crush-extended')
conflicts=('crush')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${pkgver}/crush-extended_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"
    
    # Install binary
    install -Dm755 "crush-extended" "${pkgdir}/usr/bin/crush-extended"
    
    # Install license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
