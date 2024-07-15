# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-markdown-bin'
_pkgname='LiteLoaderQQNT-Markdown'
pkgver='2.3.5'
pkgrel=1
pkgdesc='LiteLoaderQQNT插件，为QQ添加Markdown支持'
arch=('any')
url="https://github.com/d0j1a1701/${_pkgname}"
license=('unknown')
depends=('liteloader-qqnt')
provides=('liteloader-qqnt-markdown-git')
conflicts=('liteloader-qqnt-markdown-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8e188f73d1777ade8cd6799a7992a601c4dba4b7bdb5770bac49db2f6afe13e2')
b2sums=('82cae1ae80d93e96ff7a30d881fea76f36f5c636cf32a8fc7eeceebedf8e8496fd7e45d91d2192823cd76c74cb037ad682601bffa8ec755aa95b0a0a4c3e8348')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
    cp -rf "${srcdir}/${_pkgname}-${pkgver}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
}
