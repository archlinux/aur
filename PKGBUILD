# Maintainer: taotieren <admin@taotieren.com>

pkgbase=fonts-cjk
pkgname=($pkgbase{,-jp-seto,-sc-{zcool,pangmenzhengdao,huxiaobo,yrdzst,opposans,baotuxiaobaiti,shoushuti,youshe,zhenyangb},-tc-qingsongshouxieti})
pkgver=r17.6c32da2
pkgrel=1
arch=(any)
url='https://gitee.com/atzlinux/fonts-zh-cn-business-free-atzlinux'
license=(custom)
#provides=()
#conflicts=()
depends=()
makedepends=('git')

source=("${pkgbase}"'::git+https://gitee.com/atzlinux/fonts-zh-cn-business-free-atzlinux.git')

sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgbase}/"
#     git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package_fonts-cjk() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="Linux 下的免费商用字体包"
    install -dm755 "${pkgdir}/usr/share" \
                    "${pkgdir}/usr/share"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts" "${pkgdir}/usr/share"
    cp -r "${srcdir}/${pkgbase}/usr/share/doc" "${pkgdir}/usr/share"
}

package_fonts-cjk-jp-seto() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="濑户字型由日本的一位业余字体设计师 瀬戸のぞみ小姐 制作。"
    install -dm755 "${pkgdir}/usr/share/fonts/truetype/" \
                    "${pkgdir}/usr/share/doc/"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/truetype/setofont-free" "${pkgdir}/usr/share/fonts/truetype"
    cp -r "${srcdir}/${pkgbase}/usr/share/doc/fonts-setofont-free" "${pkgdir}/usr/share/doc"
}

package_fonts-cjk-sc-zcool() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="zcool 酷站 7 款字体"
    install -dm755 "${pkgdir}/usr/share/fonts/opentype/" \
                    "${pkgdir}/usr/share/fonts/truetype/" \
                    "${pkgdir}/usr/share/doc/"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/opentype/zcool-free" "${pkgdir}/usr/share/fonts/opentype"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/truetype/zcool-free" "${pkgdir}/usr/share/fonts/truetype"
    cp -r "${srcdir}/${pkgbase}/usr/share/doc/fonts-zcool-free-all" "${pkgdir}/usr/share/doc"
}

package_fonts-cjk-sc-pangmenzhengdao() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="这款字体由《庞门正道》设计公众号以及 13 位字体设计师耗资超过 10 万元联合研发。"
    install -dm755 "${pkgdir}/usr/share/fonts/opentype/" \
                    "${pkgdir}/usr/share/fonts/truetype/" \
                    "${pkgdir}/usr/share/doc/"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/opentype/pangmenzhengdao-free" "${pkgdir}/usr/share/fonts/opentype"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/truetype/pangmenzhengdao-free" "${pkgdir}/usr/share/fonts/truetype"
    cp -r "${srcdir}/${pkgbase}/usr/share/doc/fonts-pangmenzhengdao-free" "${pkgdir}/usr/share/doc"
}

package_fonts-cjk-sc-huxiaobo() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="设计师胡晓波的 3 款字体"
    install -dm755 "${pkgdir}/usr/share/fonts/opentype/" \
                    "${pkgdir}/usr/share/doc/"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/opentype/huxiaobo" "${pkgdir}/usr/share/fonts/opentype"
    cp -r "${srcdir}/${pkgbase}/usr/share/doc/fonts-huxiaobo" "${pkgdir}/usr/share/doc"
}

package_fonts-cjk-sc-yrdzst() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="杨润东竹石体：本套字体授权全社会免费商用，意味着您可以将其无限制地捆入您的商业产品中，如海报、包装、logo、网页、APP 等"
    install -dm755 "${pkgdir}/usr/share/fonts/truetype/" \
                    "${pkgdir}/usr/share/doc"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/truetype/yrdzst-free" "${pkgdir}/usr/share/fonts/truetype"
    cp -r "${srcdir}/${pkgbase}/usr/share/doc/fonts-rydzst-free" "${pkgdir}/usr/share/doc"
}

package_fonts-cjk-sc-opposans() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="OPPO Sans（含中文及西文，6 款字重）允许个人或企业免费使用，含商业用途，版权归 OPPO 广东移动通信有限公司所有。"
    install -dm755 "${pkgdir}/usr/share/fonts/truetype/" \
                    "${pkgdir}/usr/share/doc"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/truetype/oppo" "${pkgdir}/usr/share/fonts/truetype"
    cp -r "${srcdir}/${pkgbase}/usr/share/doc/fonts-opposans" "${pkgdir}/usr/share/doc"
}

package_fonts-cjk-sc-baotuxiaobaiti() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="包图小白体：定义为一款简单可爱的创意字体。"
    install -dm755 "${pkgdir}/usr/share/fonts/truetype/" \
                    "${pkgdir}/usr/share/doc"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/truetype/baotuxiaobaiti-free" "${pkgdir}/usr/share/fonts/truetype"
    cp -r "${srcdir}/${pkgbase}/usr/share/doc/fonts-baotuxiaobaiti-free" "${pkgdir}/usr/share/doc"
}


package_fonts-cjk-sc-shoushuti() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="智勇手书体：该免费字体授予全社会所有人可应用于：所有商用范围"
    install -dm755 "${pkgdir}/usr/share/fonts/truetype/" \
                    "${pkgdir}/usr/share/doc"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/truetype/shoushuti-free" "${pkgdir}/usr/share/fonts/truetype"
    cp -r "${srcdir}/${pkgbase}/usr/share/doc/fonts-shoushuti-free" "${pkgdir}/usr/share/doc"
}

package_fonts-cjk-sc-youshe() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="优设标题黑：是一款适用性广，速度感、力量感极强的专业美术标题字体。"
    install -dm755 "${pkgdir}/usr/share/fonts/truetype/business-free-zh/" \
                    "${pkgdir}/usr/share/doc"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/truetype/business-free-zh/YouSheBiaoTiHei.ttf" "${pkgdir}/usr/share/fonts/truetype/business-free-zh"
    cp -r "${srcdir}/${pkgbase}/usr/share/doc/fonts-youshe" "${pkgdir}/usr/share/doc"
}

package_fonts-cjk-sc-zhenyangb() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="锐字真言体：该免费字体授予全社会所有人可应用于： 所有商业使用范围"
    install -dm755 "${pkgdir}/usr/share/fonts/truetype/" \
                    "${pkgdir}/usr/share/doc"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/truetype/zhenyangb-free" "${pkgdir}/usr/share/fonts/truetype"
    cp -r "${srcdir}/${pkgbase}/usr/share/doc/fonts-zhenyangb-free" "${pkgdir}/usr/share/doc"
}

package_fonts-cjk-tc-qingsongshouxieti() {
    export LC_CTYPE="zh_CN.UTF-8"
    pkgdesc="清松手写体的版权归开发者游清松所有，但开放给所有人免费使用（包含商业使用）。"
    install -dm755 "${pkgdir}/usr/share/fonts/truetype/business-free-zh/" \
                    "${pkgdir}/usr/share/doc"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/truetype/business-free-zh/QingSongShouXieTi1-2.ttf" "${pkgdir}/usr/share/fonts/truetype/business-free-zh"
    cp -r "${srcdir}/${pkgbase}/usr/share/fonts/truetype/business-free-zh/QingSongShouXieTi2-2.ttf" "${pkgdir}/usr/share/fonts/truetype/business-free-zh"
    cp -r "${srcdir}/${pkgbase}/usr/share/doc/fonts-qingsongshouxieti-free" "${pkgdir}/usr/share/doc"
}

# vim: ts=4 sw=4 et
