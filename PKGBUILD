pkgname=monyhar-lite
pkgver=1.0
pkgrel=3
pkgdesc="梦弘浏览器 自主研发版本 - 完全自主研发，打破国外垄断，比 Chrome 快 600%。缺少上网功能。"
arch=('any')
makedepends=('gcc')
url="https://github.com/monyhar/monyhar-lite"
source=("https://github.com/monyhar/monyhar-lite/raw/master/main.c")

package() {
    gcc main.c -o ${pkgname}
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
md5sums=('6a13de1ac87f7e01ad496f372b7b141b')
