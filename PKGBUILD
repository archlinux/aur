# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>
pkgname='liteloader-qqnt-plugin-llapi-bin'
_pkgname='LiteLoaderQQNT-Plugin-LLAPI'
pkgver='1.3.1'
pkgrel=1
pkgdesc='A LiteLoaderQQNT plugin that can provide some APIs for other plugins'
arch=('any')
url="https://github.com/Night-stars-1/${_pkgname}"
license=("unknown")
depends=("liteloader-qqnt-bin")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("0a886218ec3b87f0dcd38451c9d914cf3a55a88214c00b88ef62ecb227d8516f")
b2sums=("addbed0efe9612045583e316f82927193699640ede4fb3b6c09f7795373b422b3a4631e6de57b571217e76e42bd0257f33c1d9546cde7c958e0ae0ba7840daca")

package() {
    install -dm777 "${pkgdir}/opt/LiteLoader"
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins"
    bsdtar -xf "v${pkgver}.tar.gz" -C "${pkgdir}/opt/LiteLoader/plugins"
    mv "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}-${pkgver}" "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}" 
}

