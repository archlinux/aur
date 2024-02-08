# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>
pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.2.4'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${url}/releases/download/${pkgver}/lite_tools_v4.zip")
sha256sums=("bcaf7fecf5279c4e5b480a953ed5385c1f30d233acd26d163a6ab236f92c3231")
b2sums=("748eb419a7f01469ffc1f6c0888e50a195ead85239e53ab8bdbcc80e835ecee0f264e26f8cc377ddb9e57610b392823492ca7581fcba27ab6a4f71113eef0014")

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
    find . -type f -exec install -D '{}' "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
}

