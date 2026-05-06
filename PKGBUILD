# Maintainer: ShortArrow <bamboogeneral@gmail.com>
pkgname=runex-bin
pkgver=0.1.14
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
sha256sums_x86_64=('23a0ece829698253c401a2d5054b9ae3db6edc06007dbd91952b278ec071ab41')
sha256sums_aarch64=('9a705e3396535e4bc52f9f249a9fcc7ef7fb3ea8091deda3ced391f8df812b6a')
sha256sums=('735fa89d57bbf22a8c85d829aa1ed791cce81ffdb900467333025ab7b2feee1c'
            '6841cfc9dce7aabf01df2cfc36c8f9ee030c16eae6e50f877f8311538c735942')

package() {
    install -Dm755 "${srcdir}/runex" "${pkgdir}/usr/bin/runex"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
