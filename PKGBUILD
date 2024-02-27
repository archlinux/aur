# Maintainer: Ming Yue <mingfengpigeon@gmail.com>

pkgname="liteloader-qqnt-plugin-llapi-bin"
_pkgname="LiteLoaderQQNT-Plugin-LLAPI"
pkgver="1.3.1.1"
pkgrel=2
pkgdesc="A LiteLoaderQQNT plugin that can provide some APIs for other plugins"
arch=("any")
url="https://github.com/Night-stars-1/${_pkgname}"
license=("unknown")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-plugin-llapi")
conflicts=("liteloader-qqnt-plugin-llapi")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("27891e28bc6dd19aa04f56b680aecc51f5befb7e3e1836e2e540861e990ff093")
b2sums=("58f450cb8a91a25c95b2b14568e179e3870fd73c1735eeb018678bf3f491ae9137f0b059f5d33545340b7759fc425ddaeee2b0d6d31f726c616fc2abb1ade122")

package() {
    # prepare to copy files
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # copy files
    cp -rf "${srcdir}/LiteLoaderQQNT-Plugin-LLAPI-${pkgver}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"

    # modify premissions
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
}

