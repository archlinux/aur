# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-markdown-git'
_pkgname='LiteLoaderQQNT-Markdown'
pkgver='1.1.0.1f2de88'
pkgrel=1
pkgdesc="LiteLoaderQQNT插件，为QQ添加Markdown支持"
arch=('any')
url="https://github.com/d0j1a1701/${_pkgname}"
license=("unknown")
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-markdown-git")
conflicts=("liteloader-qqnt-markdown-git")

source=("git+${url}.git")
sha256sums=('SKIP')
b2sums=('SKIP')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins"
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
    cp -rf "${srcdir}/${_pkgname}" "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    echo "二进制版本在liteloader-qqnt-markdown-bin可用"
}
