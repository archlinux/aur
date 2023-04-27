# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-canger-yuyang
pkgver=1.0
pkgrel=2
pkgdesc="仓耳渔阳体,任何用户可以全球任何领域永久免费商用."
arch=('any')
_downurl="http://tsanger.cn"
url="${_downurl}/category/114"
license=(custom:free)
depends=()
makedepends=()
source=(
    "canger-yuyang-W01.ttf::${_downurl}/download/%E4%BB%93%E8%80%B3%E6%B8%94%E9%98%B3%E4%BD%93W01.ttf"
    "canger-yuyang-W02.ttf::${_downurl}/download/%E4%BB%93%E8%80%B3%E6%B8%94%E9%98%B3%E4%BD%93W02.ttf"
    "canger-yuyang-W03.ttf::${_downurl}/download/%E4%BB%93%E8%80%B3%E6%B8%94%E9%98%B3%E4%BD%93W03.ttf"
    "canger-yuyang-W04.ttf::${_downurl}/download/%E4%BB%93%E8%80%B3%E6%B8%94%E9%98%B3%E4%BD%93W04.ttf"
    "canger-yuyang-W05.ttf::${_downurl}/download/%E4%BB%93%E8%80%B3%E6%B8%94%E9%98%B3%E4%BD%93W05.ttf"
    "LICENSE.pdf::${_downurl}/%E4%BB%93%E8%80%B3%E5%AD%97%E5%BA%93%E5%85%8D%E8%B4%B9%E5%95%86%E7%94%A8%E5%AD%97%E4%BD%93%E6%8E%88%E6%9D%83%E5%A3%B0%E6%98%8E.pdf"
    )
sha256sums=('4a3c5566858037d31ea290b9d436dd3f636b30c4e350aeff0dcd5ebdf71f4071'
            '3fe4d0d53fa429b4b663d8c401a83bb0c6a40a3814c081b0ba313e27d18020fa'
            '43b381d44c6f66683384b28f985215a6f5d01976d6f01b0aa011d04881462835'
            'e4f2a0648f616dc4e44fb482b436a3e1bc916e8ab509d6e46beb4820dc5e6b07'
            '67f4c70c1fbb6935dfb0923695bc3ab882ff9ee24ab2859fe08fedcccaaa75a1'
            'b49574b128a28cc646eaffe9adee91b9b7d228f5dfc8da9de6a1028ca230c54d')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -dm755 "${pkgdir}/usr/share/fonts/canger"
    install -Dm444 "${srcdir}/"*.ttf -t "${pkgdir}/usr/share/fonts/canger"
    install -Dm644 "${srcdir}/LICENSE.pdf" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}