# Maintainer: ShortArrow <bamboogeneral@gmail.com>
pkgname=runex-bin
pkgver=0.1.21
pkgrel=1
pkgdesc="Cross-shell abbreviation engine that expands short tokens into full commands"
arch=('x86_64' 'aarch64')
url="https://github.com/ShortArrow/runex"
license=('MIT' 'Apache-2.0')
provides=('runex')
conflicts=('runex')
source_x86_64=("runex-${pkgver}-x86_64.tar.gz::https://github.com/ShortArrow/runex/releases/download/v${pkgver}/runex-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("runex-${pkgver}-aarch64.tar.gz::https://github.com/ShortArrow/runex/releases/download/v${pkgver}/runex-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/ShortArrow/runex/v${pkgver}/LICENSE"
        "README-${pkgver}.md::https://raw.githubusercontent.com/ShortArrow/runex/v${pkgver}/README.md")
sha256sums_x86_64=('63285335821061f1923e5b6289523f3f5e65b6ca2ff275553a2625b68aa37df2')
sha256sums_aarch64=('057f74c62a633d904c8b4da75a50e04c4ae9d142cadd1092a939e58e4c210e75')
sha256sums=('735fa89d57bbf22a8c85d829aa1ed791cce81ffdb900467333025ab7b2feee1c'
            '9cbca79cd5344a174c242c175fe5c2cca15e2a09a1b7d71f3774ce3d3a4314ab')

package() {
    install -Dm755 "${srcdir}/runex" "${pkgdir}/usr/bin/runex"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
