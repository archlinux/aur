# Maintainer: TTsdzb <ttsdzb@outlook.com>
# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.3.6'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/lite_tools_v4.zip")
sha256sums=("f1f3b447ea8761d64d4a7ecaa1a5694f06d00533f6ca09271e10f89904403ccc")
b2sums=("79581d7868cc08ad7624dccc810889e37879cbcd33f3ca8fa9c4cf159a915f387527c906e7cc8383ec0bd3fd53a72af15bd547775e8648888cc375e008908171")

package() {
    # prepare to copy files
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # copy files
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # modify premissions
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}

