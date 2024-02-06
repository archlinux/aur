# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>
pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.1.0'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${url}/releases/download/${pkgver}/lite_tools_v4.zip")
sha256sums=("2b7fcaa0d87c9c8386067b221f171499d26531efb79de7036510a6f41fc470d3")
b2sums=("d1cf017fe7938a5a25e910076971df9f9bb6e906d9a77f29169e90dd3873b39bea4861ab7ee541a688ea9e771fad2b0d30031524d845d1437a73ec7a945f9547")

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
    find . -type f -exec install -D '{}' "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
}

