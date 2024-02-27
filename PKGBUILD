# Maintainer: TTsdzb <ttsdzb@outlook.com>
# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.7.4'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/lite_tools_v4.zip")
sha256sums=("1519349d58cf75825bf408c2adc3d8a585a5680f0a7ac63768cc017b5efd0a5f")
b2sums=("614914a139911a305fa5eeba148b86148ef7839544df6047fc4372b46ab624d0e8ac694f3106b999736bd944cbeffa8b4f4eb07f4bd5f456e5d20b37b9928351")

package() {
    # prepare to copy files
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # copy files
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # modify premissions
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}

