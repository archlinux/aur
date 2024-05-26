# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-mspring-theme-bin'
_pkgname='LiteLoaderQQNT-MSpring-Theme'
pkgver='1.3.2'
pkgrel=1
pkgdesc="LiteLoaderQQNT主题，优雅、粉粉、细致"
arch=('any')
url="https://github.com/MUKAPP/${_pkgname}"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-mspring-theme")
conflicts=("liteloader-qqnt-mspring-theme")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('5ab1ff11358b6d1daa2a5d287a1282a83c602c610666f183a5608b354362cd50')
b2sums=('98e9298096a2a6d54f45463e79d85ad51b2958ce9f1555c154979b4de5f1f6a235cfa2e1642a63309f79042c94cbc73f3c2e765480225549ca9927b49307e3ba')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod 0777 "${pkgdir}/opt/LiteLoader" "${pkgdir}/opt/LiteLoader/plugins"
    cp -r "${srcdir}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
