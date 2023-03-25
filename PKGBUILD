pkgname=nerd-fonts-sarasa-term
pkgver=1.1.0
pkgrel=1
epoch=1
pkgdesc='Sarasa Term SC font patched with Nerd fonts.'
url='https://github.com/laishulu/Sarasa-Term-SC-Nerd'
license=('OFL')
makedepends=('fontconfig')
arch=('any')
source=(
    "${url}/releases/download/v${pkgver}/sarasa-term-sc-nerd.ttc.tar.gz"
    "https://raw.githubusercontent.com/laishulu/Sarasa-Term-SC-Nerd/main/LICENSE"
)
sha256sums=(
    '57028dc7e0c58fa2e0aa41b8a4c2a060925f3d6c0877d737d4516661a676dfe4'
    '5e24aa89c520df12115f37591daf3affe87737da068227f1648ea01d70d70147'
    )

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgname}"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/"*.ttc "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
