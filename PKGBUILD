# Maintainer: Sniventals <Creeperxie@outlook.com>
# Maintainer: Creeperxie <creeperxie@hotmail.com>

pkgname='liteloader-qqnt-markdown-bin'
_pkgname='LiteLoaderQQNT-Markdown'
pkgver='2.4.1'
pkgrel=1
pkgdesc='LiteLoaderQQNT插件，为QQ添加Markdown支持'
arch=('any')
url="https://github.com/d0j1a1701/${_pkgname}"
license=('unknown')
depends=('liteloader-qqnt')
provides=('liteloader-qqnt-markdown-git')
conflicts=('liteloader-qqnt-markdown-git')

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/Release.zip")
sha256sums=('fbcb9927bbf189e4b1b2a6a00c81ff6c14fb1aaad3dbf425375c794289f0b1b6')
b2sums=('ba88a0a2d2469d21e89eed5cb7dbdc1e32fea9d39b7cdc339ae2a441f14f2d486d4b9a7378c721e7f52ccff3ff14c056b64a8b8d2afec078f0bf6063369f9a57')

package() {
    mkdir -p "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}"
    cp -rf "${srcdir}"/* "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}"
}
