pkgname=nerd-fonts-sarasa-term
pkgver=2.3.0
pkgrel=1
epoch=1
pkgdesc='Sarasa Term SC font patched with Nerd fonts.'
url='https://github.com/laishulu/Sarasa-Term-SC-Nerd'
license=('OFL')
makedepends=('fontconfig')
arch=('any')
source=(
    "${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/releases/download/v${pkgver}/SarasaTermSCNerd.ttc.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/laishulu/Sarasa-Term-SC-Nerd/main/LICENSE"
)
sha256sums=(
    '8c74d5814f4eda4af0040f0e0005294648f4d4f024fcbb038e6ceca3ffb5ba13'
    '5e24aa89c520df12115f37591daf3affe87737da068227f1648ea01d70d70147'
    )

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgname}"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/"*.ttc "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
