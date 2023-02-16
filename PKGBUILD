pkgname=nerd-fonts-sarasa-mono
pkgver=4.0.0
pkgrel=1
pkgdesc='Sarasa Mono SC font patched with Nerd fonts.'
url='https://github.com/laishulu/Sarasa-Mono-SC-Nerd'
license=('OFL')
makedepends=('fontconfig')
arch=('any')
source=(
    "${url}/releases/download/v${pkgver}/sarasa-mono-sc-nerd.zip"
    "https://raw.githubusercontent.com/laishulu/Sarasa-Mono-SC-Nerd/main/LICENSE"
)
sha256sums=(
    'f44b8e945583056c4ce3786672dcd839628a131486f55624ae828e8ed4692963'
    '5e24aa89c520df12115f37591daf3affe87737da068227f1648ea01d70d70147'
    )

package() {
    install -d "${pkgdir}/usr/share/fonts/${pkgname}"
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/"*.ttc "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
