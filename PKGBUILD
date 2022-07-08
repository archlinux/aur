# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-client
pkgver=4.19.2
_rpmpkgver=4.19.2-58
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio playe - client application"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('hqplayer' 'qt5-webengine')
source=("https://www.signalyst.eu/bins/hqplayer/fc36/hqplayer4desktop-$_rpmpkgver.fc36.x86_64.rpm")
sha256sums=('5fc9ffaa1d41d1e72760f8cd68d067eae0dcfea428faa567dfc1659f041bdb8b')
options=(!strip)
install=${pkgname}.install

package() {
install -Dm755 $srcdir/usr/bin/hqplayer4client $pkgdir/usr/bin/hqplayer4client
install -Dm644 $srcdir/usr/share/applications/hqplayer4-client.desktop $pkgdir/usr/share/applications/hqplayer4-client.desktop
install -Dm644 $srcdir/usr/share/pixmaps/hqplayer4-client.png $pkgdir/usr/share/pixmaps/hqplayer4-client.png
install -Dm644 $srcdir/usr/share/doc/hqplayer4desktop/LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}
