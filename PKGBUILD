# Maintainer: carrothu <hrxcn at 126 dot com>
pkgname=wqy-bitmapfont-otb
pkgver=1.0.0RC1
pkgrel=1
pkgdesc='文泉驿点阵宋体otb版本 The otb version of Wen Quan Yi bitmapfont'
arch=('any')
url='https://github.com/carrothu-cn/wqy-bitmapfont-otb'
license=('GPL2')
source=("https://github.com/carrothu-cn/wqy-bitmapfont-otb/releases/download/v${pkgver}/wqy-bitmapfont-otb.zip")
sha256sums=('00ed31f601bf25daaf7eda29d2358633db6d58a7b52a4149c6ee1d9048fcb0eb')

package() {
    cd "${srcdir}/wqy-bitmapfont-otb"
    install -vDm 644 "wenquanyi_9pt.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "wenquanyi_10pt.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "wenquanyi_11pt.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "wenquanyi_12pt.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "wenquanyi_13px.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
