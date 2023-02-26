pkgname=nerd-fonts-sarasa-term
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc='Sarasa Term SC font patched with Nerd fonts.'
url='https://github.com/laishulu/Sarasa-Term-SC-Nerd'
license=('OFL')
makedepends=('fontconfig')
arch=('any')
source=(
    "${url}/releases/download/v${pkgver}/sarasa-term-sc-nerd.tar.gz"
    "https://raw.githubusercontent.com/laishulu/Sarasa-Term-SC-Nerd/main/LICENSE"
)
sha256sums=(
    'a7649ddef20dc11dcaf80792c4e38bb9e9015d77310df66080078a304ea9c215'
    '5e24aa89c520df12115f37591daf3affe87737da068227f1648ea01d70d70147'
    )

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgname}"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/"*.ttc "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
