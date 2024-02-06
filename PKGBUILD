# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>
pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.1.3'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${url}/releases/download/${pkgver}/lite_tools_v4.zip")
sha256sums=("b6ae112d56012620a2d14ca39b3a904f653525a746a287d597739d56fa239aa8")
b2sums=("c1f66f7074cce1af6c21ed10e280c817f10f9560056d3cb34f72e6a91c6fc6001001e34c6cd479f771272d588851ff9d11b16b29f9eb8a88c47b8a295c6ef963")

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
    find . -type f -exec install -D '{}' "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
}

