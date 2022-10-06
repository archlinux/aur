# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-client
pkgver=4.19.3
_rpmpkgver=4.19.3-59
pkgrel=2
pkgdesc="The high-end upsampling multichannel software HD-audio playe - client application"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('hqplayer' 'qt5-webengine' 'qt5-quickcontrols2')
source=("https://www.signalyst.eu/bins/hqplayer/fc36/hqplayer4desktop-$_rpmpkgver.fc36.x86_64.rpm")
sha256sums=('644f5966ea752ef700c6ae0c0647165a6cb24da1c43e5180868eb862fa0c81a9')
options=(!strip)
install=${pkgname}.install

package() {
install -Dm755 $srcdir/usr/bin/hqplayer4client $pkgdir/usr/bin/hqplayer4client
install -Dm644 $srcdir/usr/share/applications/hqplayer4-client.desktop $pkgdir/usr/share/applications/hqplayer4-client.desktop
install -Dm644 $srcdir/usr/share/pixmaps/hqplayer4-client.png $pkgdir/usr/share/pixmaps/hqplayer4-client.png
install -Dm644 $srcdir/usr/share/doc/hqplayer4desktop/LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}
