# Maintainer: okt4v
pkgname=asat-bin
pkgver=0.1.24
pkgrel=1
pkgdesc="Terminal spreadsheet editor for Vim users — modal editing, 40+ formulas, CSV/XLSX/ODS"
arch=('x86_64')
url="https://github.com/okt4v/ASAT"
license=('GPL-3.0-or-later')
provides=('asat')
conflicts=('asat' 'asat-git')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/okt4v/ASAT/releases/download/v${pkgver}/asat-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e59718a1ee00657d3b7c229056be885dcb3f5ab33f4de241f4cd639dc12d10cd')

package() {
    install -Dm755 "asat-v${pkgver}-x86_64-unknown-linux-gnu/asat" "${pkgdir}/usr/bin/asat"
    install -Dm644 "asat-v${pkgver}-x86_64-unknown-linux-gnu/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
