# Maintainer: Quirky1869 <quirky1869@users.noreply.github.com>

pkgname=aed-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Interactive disk space analyzer for terminal (TUI)"
arch=('x86_64')
url="https://github.com/Quirky1869/aed"
license=('MIT')
provides=('aed')
conflicts=('aed')
source=("aed-${pkgver}::https://github.com/Quirky1869/aed/releases/download/v${pkgver}/aed")
sha256sums=('d9ed6031e84b5cfb53792b5f2b6ef3340bfd54b1ebd10a84c25a149670e665ce')

package() {
    install -Dm755 "${srcdir}/aed-${pkgver}" "${pkgdir}/usr/bin/aed"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
MIT License — see https://github.com/Quirky1869/aed/blob/main/LICENSE
EOF
}
