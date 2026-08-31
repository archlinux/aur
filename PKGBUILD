# Maintainer: Quirky1869 <quirky1869@users.noreply.github.com>

pkgname=aed-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Interactive disk space analyzer for terminal (TUI)"
arch=('x86_64')
url="https://github.com/Quirky1869/aed"
license=('MIT')
provides=('aed')
conflicts=('aed')
source=("aed-${pkgver}::https://github.com/Quirky1869/aed/releases/download/v${pkgver}/aed")
sha256sums=('8b92e48785e8b8b5e0560540bc9109b90c72ebccf48523d62a6f7b280088fa1f')

package() {
    install -Dm755 "${srcdir}/aed-${pkgver}" "${pkgdir}/usr/bin/aed"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
MIT License - see https://github.com/Quirky1869/aed/blob/main/LICENSE
EOF
}
