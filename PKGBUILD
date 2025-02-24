# Maintainer: carrothu <hrxcn at 126 dot com>
pkgname=wqy-unibit-otb
pkgver=1.1
pkgrel=1
pkgdesc='文泉驿Unibit字体otb版本 The otb version of Wen Quan Yi Unibit font'
arch=('any')
url='https://github.com/carrothu-cn/wqy-unibit-otb'
license=('GPL2')
source=("https://github.com/carrothu-cn/wqy-unibit-otb/releases/download/v${pkgver}/wqy-unibit-otb.zip")
sha256sums=('181bfe20b4ba394cc66bf5373d36c7724109619923713b1773904a5ff9a6ad32')

package() {
    cd "${srcdir}/wqy-unibit-otb"
    install -vDm 644 "wqy-unibit.otb" -t "${pkgdir}/usr/share/fonts/misc/"
    install -vDm 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
