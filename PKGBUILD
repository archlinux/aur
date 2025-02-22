# Maintainer: NekoLOvO <nekolyin@qq.com>

pkgname=com.qq.weixin.work.deepin
pkgver=4.1.32.6005deepin2
pkgrel=1
pkgdesc="Deepin Wine 版企业微信 | Deepin-wine Wecom"
arch=('i686' 'x86_64')
url="https://mirrors.sdu.edu.cn/spark-store-repository/store/chat/com.qq.weixin.work.deepin/"
license=('custom')
depends=('spark-dwine-helper')
source=("${url}${pkgname}_${pkgver}-${pkgrel}_all.deb")
sha256sums=('ef5921d32d609db6d1024e7e8cdfa440a50efff7776cbaac7dba48a7a65d7a9f')

package() {
    bsdtar -xf ${srcdir}/data.tar.gz -C "${pkgdir}"
    mkdir -p "${pkgdir}/usr/share"
    cp -rf ${pkgdir}/opt/apps/${pkgname}/entries/* "${pkgdir}/usr/share"
    install="cjk-font.install"
}
