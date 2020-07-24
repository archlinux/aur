# Maintainer: kostyalamer < kostyalamer@yandex.ru >
# Contributor: Yury Pakin
pkgname=mplayer-vc
pkgver=0.36.1
pkgrel=2
pkgdesc="Script for full-screen viewing of local video in mplayer via console. Autor Yury Pakin "
arch=('x86_64')
url="http://forum.russ2.com/index.php?showtopic=4431"
license=('GPL2')

depends=(
  'coreutils' 'grep' 'gawk' 'bc' 'sed' 'fbset' 'util-linux'
  'mediainfo' 'filesystem' 'mplayer'
)

source=("http://altlinuxclub.ru/arhiv/${pkgname}-${pkgver}.tar.gz")
md5sums=('9f70013dd4170e90da0e02ba56ccbe5f')

package() {

cd "$srcdir/$pkgname-$pkgver"
install -pDm755 $pkgname $pkgdir/usr/bin/$pkgname

}
