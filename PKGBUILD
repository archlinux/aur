# Maintainer: Arthur Williams <taaparthur at gmail dot com>
pkgname='mpxmanager'
pkgver='1.1.0'
pkgrel=1
pkgdesc='A MPX/Xi2 aware window manager'
arch=('any')
url="github.com/TAAPArthur/MPXManager"
license=('MIT')
options=(staticlibs !strip)
depends=('xorg-server' 'libxi' 'libx11' 'libxcb' 'xcb-util-wm' )
makedepends=('git' 'help2man')
optdepends=('xorg-server-xvfb: testing')
makedepends=('git' 'help2man')
md5sums=('SKIP')
source=( "$pkgname-$pkgver.tar.gz::https://github.com/TAAPArthur/MPXManager/archive/$pkgver.tar.gz")
package() {
  cd "MPXManager"
  make DESTDIR=$pkgdir install -j 8
}
