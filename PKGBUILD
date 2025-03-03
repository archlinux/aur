# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgbase=ttf-sarasa_ui
pkgname=(${pkgbase}-{all,cl,sc,hc,tc,jp,kr})
pkgver=1.0.29
pkgrel=1
arch=('any')
url="https://github.com/be5invis/Sarasa-Gothic/"
license=('OFL')
depends=('fontconfig')
provides=('ttf-fonts')
source=(
    "${url}raw/refs/heads/main/LICENSE"
    "${url}releases/download/v${pkgver}/SarasaUi-TTF-${pkgver}.7z"
)
sha256sums=('32c932e0dbae4f6e6386964bbc2d04178707665a05ca65cf636241af13d50a53'
            '70c4cca8ae4487b02e44f3f00904e35990d5beea8611d01c1af49fc3e19d9320')

package_ttf-sarasa_ui-all() {
    pkgdesc="Sarasa UI (CJK)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-cl() {
    pkgdesc="更纱黑体UI (传统旧字形)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*CL*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-sc() {
    pkgdesc="更纱黑体UI (简体中文)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*SC*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-hc() {
    pkgdesc="更紗黑體UI (香港繁體中文)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*HC*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-tc() {
    pkgdesc="更紗黑體UI (台湾正體中文)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*TC*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-jp() {
    pkgdesc="更紗ゴシックUI (日本語)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*J*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_ttf-sarasa_ui-kr() {
    pkgdesc="사라사고딕UI (한국인)"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 ${srcdir}/*K*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgbase}"
}
