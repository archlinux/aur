# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <mingyue@ixcm.onmicrosoft.com>

pkgname='liteloader-qqnt-markdown-bin'
_pkgname='LiteLoaderQQNT-Markdown'
pkgver='2.1.0'
pkgrel=1
pkgdesc='LiteLoaderQQNT插件，为QQ添加Markdown支持'
arch=('any')
url="https://github.com/d0j1a1701/${_pkgname}"
license=('unknown')
depends=('liteloader-qqnt')
provides=('liteloader-qqnt-markdown-git')
conflicts=('liteloader-qqnt-markdown-git')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('49af2fe9594cf94fa3d119255170ac4648c1540e09972ad8d1a119d6cbe5ab75')
b2sums=('050ea0d384eb6203401a22432f09d4d81f9c71cdbe023179a475de25af0b839a413345c7f9c7cc3dffd892db89bd73d895b382358a4b01ebc1a9c27536ca0b33')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
    chmod -R 0777 "${pkgdir}/opt/LiteLoader"
    cp -rf "${srcdir}/${_pkgname}-${pkgver}"/* "${pkgdir}/opt/LiteLoader/plugins/${_pkgname}"
}
