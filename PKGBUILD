# Maintainer: JoveYu <yushijun110@126.com>
# Contribuor: Skywol <Skywol@qq.com>
# Contribuor: wszqkzqk <wszqkzqk@gmail.com>
# Contribuor: luosoy <249799588@qq.com>


pkgname=deepin-wine-helper
_pkgver=5.1.43-1
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Deepin Wine Helper"
arch=('i686' 'x86_64')
url="http://www.deepin.org"
license=('Proprietary')
depends=('p7zip')
makedepends=('tar')
optdepends=('python2: some script dependencies')
source=("https://community-store-packages.deepin.com/appstore/pool/appstore/d/${pkgname}/${pkgname}_${_pkgver}_i386.deb")
sha256sums=('2c2224d6070967fa7c8af0486a03830c3c3fbbfc9df074869b75d531b3e296cf')

package() {
    tar -xf data.tar.xz -C ${pkgdir} --exclude="etc"
}
