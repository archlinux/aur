# Maintainer: Ming Yue <mingfengpigeon@gmail.com>

pkgname="liteloader-qqnt-plugin-llapi-bin"
_pkgname="LiteLoaderQQNT-Plugin-LLAPI"
pkgver="1.3.1.2"
pkgrel=1
pkgdesc="A LiteLoaderQQNT plugin that can provide some APIs for other plugins"
arch=("any")
url="https://github.com/Night-stars-1/${_pkgname}"
license=("unknown")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-plugin-llapi")
conflicts=("liteloader-qqnt-plugin-llapi")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("da2ceb8bbcdb4618fadca30282a126a2491acc456da9c7a3ed796aa930e9dc91")
b2sums=("e6bb9c9fe01540615a714ed46cda2389b70a9b802d8fcd37cc3a754ba6e40644e12205c69946fc9a4de9dab3d8f7ca5c808ea1ea57ebc49e74611183a5e6a1fe")

package() {
    # prepare to copy files
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # copy files
    cp -rf "${srcdir}/LiteLoaderQQNT-Plugin-LLAPI-${pkgver}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # modify premissions
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}

