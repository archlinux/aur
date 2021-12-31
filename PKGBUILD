# Maintainer: Jove Yu <yushijun110@126.com>
pkgname=com.tencent.weixin
pkgver=2.1.1
pkgrel=1
pkgdesc="微信桌面版"
arch=('x86_64')
url="http://pc.weixin.qq.com/"
license=('ISC')
options=('!strip')
depends=(
)
source=(
    "https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/${pkgname}_${pkgver}_amd64.deb"
)
md5sums=(
    'd9fb99271b4d2279a9c0eaefee9b59b2'
)

package() {
    tar -xf data.tar.xz -C ${pkgdir}
}
