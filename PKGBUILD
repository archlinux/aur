# Maintainer: Ming Yue <mingfengpigeon@gmail.com>

pkgname="liteloader-qqnt-plugin-llapi-bin"
_pkgname="LiteLoaderQQNT-Plugin-LLAPI"
pkgver="1.4.0"
pkgrel=1
pkgdesc="A LiteLoaderQQNT plugin that can provide some APIs for other plugins"
arch=("any")
url="https://github.com/Night-stars-1/${_pkgname}"
license=("unknown")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-plugin-llapi")
conflicts=("liteloader-qqnt-plugin-llapi")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("d59e0497b33fb9fd1e3f891d63622fea096113b0cc319b3eea3f5507c830f1dd")
b2sums=("93ca762fd4d22464260945cd1a46e97e0b2a676d335c3659e88d2c6207a938a7544e93dcf18b9cf7e6a8b1b8cda69faceb5d08e88660acc14c41929e205eb8a4")

package() {
    # prepare to copy files
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # copy files
    cp -rf "${srcdir}/LiteLoaderQQNT-Plugin-LLAPI-${pkgver}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # modify premissions
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}

