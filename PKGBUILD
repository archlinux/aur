# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgbase=ttf-sarasa_ui
pkgname=(${pkgbase}{,-cl,-sc,-hc,-tc,-jp,-kr})
pkgver=1.0.28
pkgrel=1
arch=('any')
url="https://github.com/be5invis/Sarasa-Gothic/"
license=('OFL')
depends=('fontconfig')
source=(
    "${url}raw/refs/heads/main/LICENSE"
    "${url}releases/download/v${pkgver}/SarasaUi-TTF-${pkgver}.7z"
)
sha256sums=('32c932e0dbae4f6e6386964bbc2d04178707665a05ca65cf636241af13d50a53'
            '8a4a96914ab16d74e9d07f196596ff3d3eb7875a0da7de31e6190a6d79139932')

package_ttf-sarasa_ui() {
    pkgdesc="Sarasa Gothic for UI (CJK)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-cl() {
    pkgdesc="更纱黑体 for UI (旧汉字)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*CL*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-sc() {
    pkgdesc="更纱黑体 for UI (简体中文)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*SC*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-hc() {
    pkgdesc="更紗黑體 for UI (香港繁体中文)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*HC*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-tc() {
    pkgdesc="更紗黑體 for UI (台灣正體中文)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*TC*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-jp() {
    pkgdesc="更紗ゴシック for UI (日本語)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*J*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-kr() {
    pkgdesc="사라사고딕 for UI (한국인)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*K*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}
