# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgbase=ttf-sarasa_ui
pkgname=(${pkgbase}-{all,cl,sc,hc,tc,jp,kr})
pkgver=1.0.33
pkgrel=2
arch=('any')
url="https://github.com/be5invis/Sarasa-Gothic/"
license=('OFL')
provides=('ttf-fonts')
source=(
    "${url}raw/refs/heads/main/LICENSE"
    "${url}releases/download/v${pkgver}/SarasaUi-TTF-${pkgver}.7z"
)
sha256sums=('32c932e0dbae4f6e6386964bbc2d04178707665a05ca65cf636241af13d50a53'
            '9a6452f0d433a1ad2be1989c91a4dd1e26f0dc6410e6a00e55a9251168977c94')

package_ttf-sarasa_ui-all() {
    pkgdesc="Sarasa UI (CJK)"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    cp -rf ${srcdir}/*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}/"
}

package_ttf-sarasa_ui-cl() {
    pkgdesc="更纱黑体UI (传统旧字形)"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    cp -rf ${srcdir}/*CL*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}/"
}

package_ttf-sarasa_ui-sc() {
    pkgdesc="更纱黑体UI (简体中文)"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    cp -rf ${srcdir}/*SC*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}/"
}

package_ttf-sarasa_ui-hc() {
    pkgdesc="更紗黑體UI (香港繁體中文)"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    cp -rf ${srcdir}/*HC*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}/"
}

package_ttf-sarasa_ui-tc() {
    pkgdesc="更紗黑體UI (台湾正體中文)"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    cp -rf ${srcdir}/*TC*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}/"
}

package_ttf-sarasa_ui-jp() {
    pkgdesc="更紗ゴシックUI (日本語)"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    cp -rf ${srcdir}/*J*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}/"
}

package_ttf-sarasa_ui-kr() {
    pkgdesc="사라사고딕UI (한국인)"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/fonts/${pkgbase}"
    cp -rf ${srcdir}/*K*.ttf "${pkgdir}/usr/share/fonts/${pkgbase}/"
}
