# Maintainer: TTsdzb <ttsdzb@outlook.com>
# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.5.2'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/lite_tools_v4.zip")
sha256sums=("2dc39d9c6bd0c750981bb9f7fabb40115bac69c86e57591927cd30d56b12a309")
b2sums=("0736d5448d4914dc09fd660a8052c05dcc1751f76a6c4ccde00a0747e63095e298ec1257506b44956845690d4ff7e803f2550acaa8d1c6c946a09a2ad122680b")

package() {
    # prepare to copy files
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # copy files
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # modify premissions
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}

