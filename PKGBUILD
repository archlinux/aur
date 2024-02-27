# Maintainer: TTsdzb <ttsdzb@outlook.com>
# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.5.0'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/lite_tools_v4.zip")
sha256sums=("5151b08da438c5abad0346e25b38a85d94395dfda2dab85d2aba3a3d4625a51d")
b2sums=("844a0302e6a1dbc5e22a8bc1ef4891f432e3af1755af209506a0abbc95fe0fcac82dc934f6c9f9f3c8fa0c3a0642396b5d44b9326dfa41b3dbbe45f444e4b71f")

package() {
    # prepare to copy files
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # copy files
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # modify premissions
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}

