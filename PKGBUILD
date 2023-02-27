# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-maoken-unbounded-sans
pkgver=1.002
pkgdesc="无界黑-本字型是在 Dela Gothic One 的基础上补上简化字和简体中文常用字符。目前本字体支援 GB/T 2312 及元素周期表的元素名称。"
pkgrel=1
arch=(any)
url='https://www.maoken.com/unbound'
_githuburl='https://github.com/maoken-fonts/unbounded-sans'
license=(OFL1.1)
depends=()
makedepends=()
source=("UnboundedSans-Regular.ttf::${_githuburl}/raw/main/fonts/UnboundedSans-Regular.ttf")
sha256sums=('3e12a22d3e3af7d3cadb54aa893bcc871b01fca7e96dbe727529e9584d8a1bed')
package() {
    export LC_CTYPE="zh_CN.UTF-8"    
    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    cp "${srcdir}/UnboundedSans-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF"
}
