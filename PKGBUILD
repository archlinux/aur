# Maintainer: TTsdzb <ttsdzb@outlook.com>
# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-lite-tools-bin'
_pkgname='LiteLoaderQQNT-lite_tools'
pkgver='2.4.0'
pkgrel=1
pkgdesc='A lightweight, elegant and efficient LiteLoaderQQNT plugin for lite tools'
arch=('any')
url="https://github.com/xiyuesaves/LiteLoaderQQNT-lite_tools"
license=("MIT")
depends=("liteloader-qqnt-bin")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/lite_tools_v4.zip")
sha256sums=("d22a24ab0ac663c34190d3f83788d99cb21f962f1e5c5b63bdd1b4ff134b380b")
b2sums=("ba1ef1386c6d2c7f830c7d67c50125e8fcff69d149d7bed051e951b7b29a2071c1498071cf18c94f3bf6deb2b9e8c436da3295fb29f4425bd9bcc879866ecfdf")

package() {
    # prepare to copy files
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # copy files
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # modify premissions
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}
 
