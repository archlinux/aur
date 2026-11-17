# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ttf-yunzhuanduren
pkgname=(ttf-yunzhuanduren)
pkgver=1.0.0
pkgrel=1
pkgdesc="云篆度人经开源字体：4616 个云篆字形"
url="https://github.com/Lawrence-of-AnKing/yunzhuan-duren"
provides=(${pkgname})
conflicts=(${pkgname})
makedepends=('fontconfig')
license=("OFL-1.1")
arch=(any)
source=(
    "YunZhuanDuRen-v$pkgver.zip::${url}/releases/download/v${pkgver}/YunZhuanDuRen-v${pkgver}.zip"
)

sha256sums=('fcbd4d3ffa512c92b444d48eba9b9d1428d152529dba73d74c3f971be7f93578')

package() {
    cd ${srcdir}/YunZhuanDuRen-v$pkgver
    install -vDm644 *.ttf -t "${pkgdir}/usr/share/fonts/TTF/"
    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm644 *.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
# vim: ts=4 sw=4 et
