# Maintainer: JoveYu <yushijun110@126.com>
# Contribuor: Skywol <Skywol@qq.com>
# Contribuor: wszqkzqk <wszqkzqk@gmail.com>
# Contribuor: luosoy <249799588@qq.com>

pkgname=deepin-wine-helper
_pkgver=5.1.42-1
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Deepin Wine Helper"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
depends=()
makedepends=('tar')
source=("https://community-store-packages.deepin.com/appstore/pool/appstore/d/${pkgname}/${pkgname}_${_pkgver}_i386.deb")
md5sums=('2ed6014301d401b6e7107af7673ff69a')

package() {
    tar -xf data.tar.xz -C ${pkgdir} --exclude="etc"
}
