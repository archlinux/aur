# Maintainer: okt4v
pkgname=asat-bin
pkgver=0.1.27
pkgrel=1
pkgdesc="Terminal spreadsheet editor for Vim users — modal editing, 40+ formulas, CSV/XLSX/ODS"
arch=('x86_64')
url="https://github.com/okt4v/ASAT"
license=('GPL-3.0-or-later')
provides=('asat')
conflicts=('asat' 'asat-git')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/okt4v/ASAT/releases/download/v${pkgver}/asat-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d26291b4de1abdbd1f0a331020ad135a3a44cae8def4e87e2f43868fd1d7ab0e')

package() {
    install -Dm755 "asat-v${pkgver}-x86_64-unknown-linux-gnu/asat" "${pkgdir}/usr/bin/asat"
    install -Dm644 "asat-v${pkgver}-x86_64-unknown-linux-gnu/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
