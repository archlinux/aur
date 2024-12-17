# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <creeperxie@hotmail.com>

pkgname='liteloader-qqnt-mspring-theme-bin'
_pkgname='LiteLoaderQQNT-MSpring-Theme'
pkgver='1.3.7'
pkgrel=1
pkgdesc="LiteLoaderQQNT主题，优雅、粉粉、细致"
arch=('any')
url="https://github.com/MUKAPP/${_pkgname}"
license=("MIT")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-mspring-theme")
conflicts=("liteloader-qqnt-mspring-theme")

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_pkgname}.zip")
sha256sums=('bcfa2f517b133253c7caafd2de3d4850dba38a68847a5cbd36772341fd0e7419')
b2sums=('9e78878ff7648d5148220faebc70ca5ff8537788a6ea0230b58ce2f0863a66889c36d35923ab64ee9c0280e147618fe248733d7b5d4c8f7f690f2a2c0bb70529')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}"
    cp -r "${srcdir}"/* "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}"
    rm "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}/${pkgname}-${pkgver}.zip"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
