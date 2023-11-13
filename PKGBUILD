# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-harmonyos-sans
pkgver=2022.7.4
pkgrel=3
pkgdesc="HarmonyOS Sans 字体"
arch=("any")
url='https://developer.harmonyos.com/cn/design/resource'
license=("custom")
conflicts=("harmonyos-sans")
source=("${pkgname}-${pkgver}.zip::https://developer.harmonyos.com/resource/image/design/res/download/general/HarmonyOS-Sans.zip")
sha256sums=('fb02c86e358cd9aad8d4dfa957ee502381e7ee2e94499a9133add4324b6ce69a')
package() {
    export LC_CTYPE="zh_CN.UTF-8"   
    install -Dm644 "${srcdir}/HarmonyOS Sans/"HarmonyOS_Sans*/*.ttf -t "${pkgdir}/usr/share/fonts/harmonyos-sans"
    install -Dm644 "${srcdir}/HarmonyOS Sans/HarmonyOS_Sans/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}