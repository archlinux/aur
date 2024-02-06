# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>
pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.2.0'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${url}/releases/download/${pkgver}/lite_tools_v4.zip")
sha256sums=("c8a4f99cc98f716c64b3376adac6bc5af0a794516313d71b296e365400bd58d4")
b2sums=("34a8d9c0c27ba79d3160afccdeaae99ae88a67624f0ced248c121ce1d6df8e434351175c6b99cb29d405ac87b7e126afcfa6fa4546e151a1d7369c946aa020db")

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
    find . -type f -exec install -D '{}' "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
}

