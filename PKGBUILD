# Maintainer: okt4v
pkgname=asat-bin
pkgver=0.1.21
pkgrel=1
pkgdesc="Terminal spreadsheet editor for Vim users — modal editing, 40+ formulas, CSV/XLSX/ODS"
arch=('x86_64')
url="https://github.com/okt4v/ASAT"
license=('GPL-3.0-or-later')
provides=('asat')
conflicts=('asat' 'asat-git')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/okt4v/ASAT/releases/download/v${pkgver}/asat-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d2089311761edecea893e70f8397875bf790ecc4d87513cc4f9735d6d9a48c67')

package() {
    install -Dm755 "asat-v${pkgver}-x86_64-unknown-linux-gnu/asat" "${pkgdir}/usr/bin/asat"
    install -Dm644 "asat-v${pkgver}-x86_64-unknown-linux-gnu/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
