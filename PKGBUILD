# Maintainer: Arthur Williams <taaparthur at gmail dot com>
pkgname='mpxmanager'
pkgver='1.2.0'
pkgrel=2
pkgdesc='A MPX/Xi2 aware window manager'
arch=('any')
url="github.com/TAAPArthur/MPXManager"
license=('MIT')
options=(staticlibs !strip)
depends=('xorg-server' 'libxi' 'libx11' 'libxcb' 'xcb-util-wm' )
optdepends=('xorg-server-xvfb: testing')
makedepends=('help2man')
md5sums=('cb250cf3519f48f8b355a3b87dd94001')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TAAPArthur/MPXManager/archive/$pkgver.tar.gz")
package() {
  cd "MPXManager-$pkgver"
  make DESTDIR=$pkgdir install -j 8
}
