# Maintainer: Ming Yue <mingfengpigeon@gmail.com>

pkgname='liteloader-qqnt-markdown-bin'
_pkgname='LiteLoaderQQNT-Markdown'
pkgver='1.0.0'
pkgrel=1
pkgdesc='LiteLoaderQQNT插件，为QQ添加Markdown支持'
arch=('any')
url="https://github.com/d0j1a1701/${_pkgname}"
license=('unknown')
depends=('liteloader-qqnt')
provides=('liteloader-qqnt-markdown-git')
conflicts=('liteloader-qqnt-markdown-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('71e7d99619b53a381bc26b556b36e89ea843d9e1e75bd5576a80ee5a66237f2f')
b2sums=('445b2331432a0a9a2872ced618fb06a0f055fb1444b561ae30d2076eab430087b8960805e5cb8b1869ab3d47f4c560430f51fdce4b9f8332576e1a94502edb81')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
    cp -rf "${srcdir}/${_pkgname}-${pkgver}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
}
