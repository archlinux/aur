# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-markdown-bin'
_pkgname='LiteLoaderQQNT-Markdown'
pkgver='2.3.3'
pkgrel=1
pkgdesc='LiteLoaderQQNT插件，为QQ添加Markdown支持'
arch=('any')
url="https://github.com/d0j1a1701/${_pkgname}"
license=('unknown')
depends=('liteloader-qqnt')
provides=('liteloader-qqnt-markdown-git')
conflicts=('liteloader-qqnt-markdown-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('489b4597ea3cfea2aa6d18b22383acb6f07c5fcab99e65f6c599a1ef0cedf0ea')
b2sums=('ec8c168351f8707cc413a2ab8f940e021ae7d6c98ff4b6610ce047ef635e612e42be15fe4270819e8c42ac99dbcaa40bb5bb83cf221a28973170d6b264d7fccb')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
    cp -rf "${srcdir}/${_pkgname}-${pkgver}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
}
