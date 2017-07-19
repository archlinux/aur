#Maintainer: Alia Skywol <skywol@qq.com>

pkgname=marea-icon-theme
pkgver=1.0
pkgrel=1
pkgdesc="Marea Icons"
arch=('any')
url="https://github.com/Skywol/Marea-icon-theme"
license=('GPL3')
replaces=('')
conflicts=('')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Skywol/Marea-icon-theme/archive/$pkgver.tar.gz")
sha512sums=('0b3f3d9088874a2418083c9e07b0285a19d4480e852ee9a6dd1d0f11631b0064bc83e140bf1b992d6385ccb1ea9403f8f73b9672fc1d7438e384ead510d733d1')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
