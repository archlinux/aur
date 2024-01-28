# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>
pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.0.8'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/mo-jinran/chii-devtools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${url}/releases/download/${pkgver}/lite_tools_v4.zip")
sha256sums=("dfd3a06fe82ee2f2b21d1cad0f541b04442cdd0fd54a7c1444d2310cb160d684")
b2sums=("24fbc73fe1f661d00d0fb0f4213504121435db7ec29ce59b67dfaea3f535f4001bff4fdfc0f8457fb221b6c62f63a3612a441ec20ca0f066b999717155445765")

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
    find . -type f -exec install -D '{}' "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
}

