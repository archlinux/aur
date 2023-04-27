# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-canger-zhoukezhengdabangshu
pkgver=1.0
pkgrel=2
pkgdesc="仓耳周珂正大榜书,任何用户可以全球任何领域永久免费商用."
arch=(any)
_downurl="http://tsanger.cn"
url="${_downurl}/category/114"
license=(custom:free)
depends=()
makedepends=()
source=("canger-zhoukezhengdabangshu.ttf::${_downurl}/download/%E4%BB%93%E8%80%B3%E5%91%A8%E7%8F%82%E6%AD%A3%E5%A4%A7%E6%A6%9C%E4%B9%A6.ttf"
    "LICENSE.pdf::${_downurl}/%E4%BB%93%E8%80%B3%E5%AD%97%E5%BA%93%E5%85%8D%E8%B4%B9%E5%95%86%E7%94%A8%E5%AD%97%E4%BD%93%E6%8E%88%E6%9D%83%E5%A3%B0%E6%98%8E.pdf")
sha256sums=('598e95ff626957ca26c74eae412b14394fcf5062c2cd17453d18cdb69843d695'
            'b49574b128a28cc646eaffe9adee91b9b7d228f5dfc8da9de6a1028ca230c54d')
package() {
    export LC_CTYPE="zh_CN.UTF-8"
    install -dm755 "${pkgdir}/usr/share/fonts/canger"
    install -Dm444 "${srcdir}/"*.ttf -t "${pkgdir}/usr/share/fonts/canger"
    install -Dm644 "${srcdir}/LICENSE.pdf" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
