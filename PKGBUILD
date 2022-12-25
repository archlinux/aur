# Maintainer: kumax <kumax2048@pm.me>
pkgname=wechat-devtools-bin
pkgver=1.06.2209070
pkgrel=1
epoch=2
pkgdesc="WeChat Devtools For Linux."
license=("MIT")
arch=("x86_64")
url="https://github.com/msojocs/wechat-web-devtools-linux"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=("gconf" "libxkbfile")
options=("!strip")
source=("${pkgname%-bin}-${epoch}-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst::${url}/releases/download/v${pkgver}-${pkgrel}/${pkgname%-bin}-${epoch}-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")
md5sums=('e10f6c9f216c2dd5954ce274eec05cf4')

package() {
    cp -r ${srcdir}/opt ${pkgdir}/opt
    cp -r ${srcdir}/usr ${pkgdir}/usr
}
