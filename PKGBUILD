# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-client
pkgver=4.20.0
_rpmpkgver=4.20.0-60
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio playe - client application"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('hqplayer' 'qt5-webengine' 'qt5-quickcontrols2')
source=("https://www.signalyst.eu/bins/hqplayer/fc36/hqplayer4desktop-$_rpmpkgver.fc36.x86_64.rpm")
sha256sums=('cb8bb0fce3df3388aeb30a3b8ecf22a2aa4e0dd3241dcadf6711301b663f0511')
options=(!strip)
install=${pkgname}.install

package() {
install -Dm755 $srcdir/usr/bin/hqplayer4client $pkgdir/usr/bin/hqplayer4client
install -Dm644 $srcdir/usr/share/applications/hqplayer4-client.desktop $pkgdir/usr/share/applications/hqplayer4-client.desktop
install -Dm644 $srcdir/usr/share/pixmaps/hqplayer4-client.png $pkgdir/usr/share/pixmaps/hqplayer4-client.png
install -Dm644 $srcdir/usr/share/doc/hqplayer4desktop/LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}
