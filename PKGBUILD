# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wechat-backup
pkgver=1.0.0
pkgrel=2
pkgdesc="微信聊天记录持久化备份本地硬盘，释放手机存储空间。"
arch=('x86_64')
url="https://github.com/greycodee/wechat-backup"
license=('MIT')
options=(!strip)
depends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}_linux_v${pkgver}.tar.gz"
        "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('f24aed56689610453f001b4ee3ee32cae2a528d618f51d4888ea6cd2b1870eb0'
            'b005601baa4543fdcf1b9e9409b97f6697f58f303c8013398d252017d2c0d407')
package() {
    install -Dm755 "${srcdir}/dist/linux/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}