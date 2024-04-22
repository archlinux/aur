# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=i-ming
pkgname="ttf-${_pkgname}-fonts"
_appname=I.Ming
pkgver=8.10
pkgdesc="I.Ming ( I.明體 / 一点明朝体 / 一點明體 )"
pkgrel=1
arch=("any")
url="https://github.com/ichitenfont/I.Ming"
license=("IPA")
source=(
    "${pkgname}.ttf::https://raw.githubusercontent.com/ichitenfont/I.Ming/${pkgver}/${pkgver}/I.Ming-${pkgver}.ttf"
    "ttf-${_pkgname}cp.ttf::https://raw.githubusercontent.com/ichitenfont/I.Ming/${pkgver}/${pkgver}/I.MingCP-${pkgver}.ttf"
    "ttf-${_pkgname}varcp.ttf::https://raw.githubusercontent.com/ichitenfont/I.Ming/${pkgver}/${pkgver}/I.MingVarCP-${pkgver}.ttf"
    "ttf-${_pkgname}u.ttf::https://raw.githubusercontent.com/ichitenfont/I.Ming/${pkgver}/${pkgver}/PMingI.U-${pkgver}.ttf"
    "ttf-${_pkgname}uvar.ttf::https://raw.githubusercontent.com/ichitenfont/I.Ming/${pkgver}/${pkgver}/PMingI.UVar-${pkgver}.ttf"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/ichitenfont/I.Ming/${pkgver}/LICENSE.md"
)
sha256sums=('cba13b75b050d671b611d0063147262e421e14359ad4530948b070f56111f0f3'
            '1c411a2e97b65c26aaa01707bbe06919569fcd7683c8bb5db114a96264710458'
            '9d342893b0eddc5baa46398eb9e83741cad86143ddd493bdb8d04268d78ad527'
            '4bcaff6de675cab7912a01c508aa49b01bccdacff263c9e31657f7e2f821046e'
            'ff7422de26cd162568178a2612baedf7d409b191870a5f0c91e00a51731005ce'
            '5ddbaf00dbc1888b25c5964d5f033ea32c8e53fac90efc089c5316190b776b32')
package() {
    install -Dm444 "${srcdir}/"*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}