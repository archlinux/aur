# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <creeperxie@hotmail.com>

pkgname='liteloader-qqnt-mspring-theme-bin'
_pkgname='LiteLoaderQQNT-MSpring-Theme'
pkgver='1.3.4'
pkgrel=2
pkgdesc="LiteLoaderQQNT主题，优雅、粉粉、细致"
arch=('any')
url="https://github.com/MUKAPP/${_pkgname}"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-mspring-theme")
conflicts=("liteloader-qqnt-mspring-theme")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('c640303a5198f074ddb6648001df9c39134b48643dbd6fb59c20333ca82e222c')
b2sums=('bcfc3a2215e298c382fbdb5e5acff2b3cc73c6cf6e20eab19a9797129b7610a531951fab2f3fb25d230d30695cb6f03907b2e85730682159c25ac21a6cd8c66c')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}"
    cp -r "${srcdir}"/* "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}"
    rm "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}/${pkgname}-${pkgver}.zip"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
