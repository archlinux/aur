# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-client
pkgver=4.19.1
_rpmpkgver=4.19.1-57
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio playe - client application"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('hqplayer' 'qt5-webengine')
source=("https://www.signalyst.eu/bins/hqplayer/fc35/hqplayer4desktop-$_rpmpkgver.fc35.x86_64.rpm")
sha256sums=('718e2e97e9ac77bbebb6e2d01dee38fdb259b1e9ace0d7493186d3d928229cfe')
options=(!strip)
install=${pkgname}.install

package() {
#bsdtar xf hqplayer4desktop-"$_rpmpkgver".fc35.x86_64.rpm -C "$pkgdir"
install -Dm755 $srcdir/usr/bin/hqplayer4client $pkgdir/usr/bin/hqplayer4client
install -Dm644 $srcdir/usr/share/applications/hqplayer4-client.desktop $pkgdir/usr/share/applications/hqplayer4-client.desktop
install -Dm644 $srcdir/usr/share/pixmaps/hqplayer4-client.png $pkgdir/usr/share/pixmaps/hqplayer4-client.png
install -Dm644 $srcdir/usr/share/doc/hqplayer4desktop/LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}
