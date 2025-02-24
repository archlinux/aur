pkgname=nerd-fonts-sarasa-term
pkgver=2.3.1
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
    '5a25c36d77694667f847c22475e202de352ec1128f5055081d3e82cd8a039ae2'
    '5e24aa89c520df12115f37591daf3affe87737da068227f1648ea01d70d70147'
    )

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgname}"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/"*.ttc "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
