# Maintainer: Ming Yue <mingfengpigeon@gmail.com>

pkgname='liteloader-qqnt-markdown-bin'
_pkgname='LiteLoaderQQNT-Markdown'
pkgver='1.1.0'
pkgrel=1
pkgdesc='LiteLoaderQQNT插件，为QQ添加Markdown支持'
arch=('any')
url="https://github.com/d0j1a1701/${_pkgname}"
license=('unknown')
depends=('liteloader-qqnt')
provides=('liteloader-qqnt-markdown-git')
conflicts=('liteloader-qqnt-markdown-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('72abe7b464ca33165c31e7c93d2a03f366ff03c66480f97fc8910c95ce506ffd')
b2sums=('80537c4610d2db9591c79e3683fd3da41d3a79dcd657b6d880034b31271d1d75c532ff039f8d945cd40e440e0960fa936f6ee42da389cdb92c7097d4f39a051d')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
    cp -rf "${srcdir}/${_pkgname}-${pkgver}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
}
