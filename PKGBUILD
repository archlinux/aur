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
sha256sums=('c55cfa78e42afc1bb0b4d9bdf3234dd97cb9edff326895b59a146ed9af82b22d')

package() {
    tar -xf data.tar.xz -C ${pkgdir} --exclude="etc"
}
