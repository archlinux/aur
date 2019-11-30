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
optdepends=('xorg-server-xvfb: testing')
makedepends=('help2man')
md5sums=('c242af6c10a1826125c7f497cead860d')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TAAPArthur/MPXManager/archive/$pkgver.tar.gz")
package() {
  cd "MPXManager-$pkgver"
  make DESTDIR=$pkgdir install -j 8
}
