# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-canger-shuyuan
pkgver=1.0
pkgdesc="仓耳舒圆体,任何用户可以全球任何领域永久免费商用."
pkgrel=1
arch=(any)
url='http://tsanger.cn/category/114'
license=(custom)
depends=()
makedepends=()
source=(
    "canger-shuyuan-W01.ttf::http://tsanger.cn/download/%E4%BB%93%E8%80%B3%E8%88%92%E5%9C%86%E4%BD%93W01.ttf"
    "canger-shuyuan-W02.ttf::http://tsanger.cn/download/%E4%BB%93%E8%80%B3%E8%88%92%E5%9C%86%E4%BD%93W02.ttf"
    "canger-shuyuan-W03.ttf::http://tsanger.cn/download/%E4%BB%93%E8%80%B3%E8%88%92%E5%9C%86%E4%BD%93W03.ttf"
    "canger-shuyuan-W04.ttf::http://tsanger.cn/download/%E4%BB%93%E8%80%B3%E8%88%92%E5%9C%86%E4%BD%93W04.ttf"
    "canger-shuyuan-W05.ttf::http://tsanger.cn/download/%E4%BB%93%E8%80%B3%E8%88%92%E5%9C%86%E4%BD%93W05.ttf"
    )
sha256sums=('b3df1ac6ac60337c68172ae399d3bd7faa965ec768eb8c6b2cf43bda929cd27a'
            'ca6d0f4ff8c4b1c6f8c723edcd1c38d83361a80310432d9ac5e4cfc12a7a1b7c'
            'f14661097e363eee4dbbf9007ef695a8ca1e2489cc2c4b4c0bda2f6dfa09e0d8'
            '127ac00c22fe844dd8eeb12dfd7437007a4c69b0e43a106f62eebcc676e8c419'
            'ba341c81b5d6d58edd73a0d8bcb616c0c3d149f299d47d03c6a6f53b58443fe9')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -dm755 "${pkgdir}/usr/share/fonts/canger"
    cp "${srcdir}/"canger-shuyuan-*.ttf "${pkgdir}/usr/share/fonts/canger"
}
