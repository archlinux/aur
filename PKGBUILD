# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>
# Contributor: TTsdzb <ttsdzb@outlook.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.3.5'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/lite_tools_v4.zip")
sha256sums=("2951ac2dea7c2118d48722b9aa778d3f913f9f65a03499f83fb059f8d219d391")
b2sums=("7c843d7640d3494d32aea157634d76b89e4981639d230b5139f72850ba30d9698f229c5edcef749387f28e5b49c879470cd39dc6825463f0268317178de4658c")

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
    find . -type f -exec install -D '{}' "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}/{}" ';'
}

