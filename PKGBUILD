# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-canger-yumo
pkgver=1.0
pkgrel=4
pkgdesc="仓耳与墨体,任何用户可以全球任何领域永久免费商用."
arch=('any')
_downurl="http://tsanger.cn"
url="${_downurl}/category/114"
license=("LicenseRef-custom")
provides=("canger")
conflicts=("${pkgname}" "canger-yumo")
source=("${pkgname}-W01.ttf::${_downurl}/download/%E4%BB%93%E8%80%B3%E4%B8%8E%E5%A2%A8W01.ttf"
    "${pkgname}-W02.ttf::${_downurl}/download/%E4%BB%93%E8%80%B3%E4%B8%8E%E5%A2%A8W02.ttf"
    "${pkgname}-W03.ttf::${_downurl}/download/%E4%BB%93%E8%80%B3%E4%B8%8E%E5%A2%A8W03.ttf"
    "${pkgname}-W04.ttf::${_downurl}/download/%E4%BB%93%E8%80%B3%E4%B8%8E%E5%A2%A8W04.ttf"
    "${pkgname}-W05.ttf::${_downurl}/download/%E4%BB%93%E8%80%B3%E4%B8%8E%E5%A2%A8W05.ttf"
    "LICENSE-${pkgver}.pdf::${_downurl}/%E4%BB%93%E8%80%B3%E5%AD%97%E5%BA%93%E5%85%8D%E8%B4%B9%E5%95%86%E7%94%A8%E5%AD%97%E4%BD%93%E6%8E%88%E6%9D%83%E5%A3%B0%E6%98%8E.pdf")
sha256sums=('6da596e2a144b7a683635b29e8b80b265addc1151dab713283270b71e8d2d76f'
            '2e375ccc39729ad4a090463b58115e6e8e6771526a5a7abb1b8e4ac9b408a6b7'
            '280e4285efc6324946b25c4390199eac6707b7c2c2ac230d4ee2dea244e8b1c9'
            'd8eadaf68fd2cbb96abf2b5147e184773df734ebf7bcdea8f1a8ec259905b1d3'
            'c5aac316d7639d719da229440ea7debe7a5adf89db172f1f225da2bf2ae53482'
            'dd032d62dc79a2b7b4e07b34ebd8e41c68ab943fa590f21a13fe9f649d0ae468')
package() {
    export LC_CTYPE="zh_CN.UTF-8"   
    install -Dm444 "${srcdir}/"*.ttf -t "${pkgdir}/usr/share/fonts/canger"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.pdf" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}