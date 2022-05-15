# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-client
pkgver=4.19.0
_rpmpkgver=4.19.0-56
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio playe - client application"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
optdepends=('hqplayer-embedded' 'hqplayer-embedded-amd' 'hqplayer4')
source=("https://www.signalyst.eu/bins/hqplayer/fc35/hqplayer4desktop-$_rpmpkgver.fc35.x86_64.rpm")
sha256sums=('9e74817162a435076c2a9bafb23acd34761554cfa2e235022e1c611632e841a0')
options=(!strip)

package() {
#bsdtar xf hqplayer4desktop-"$_rpmpkgver".fc35.x86_64.rpm -C "$pkgdir"
install -Dm755 $srcdir/usr/bin/hqplayer4client $pkgdir/usr/bin/hqplayer4client
install -Dm644 $srcdir/usr/share/applications/hqplayer4-client.desktop $pkgdir/usr/share/applications/hqplayer4-client.desktop
install -Dm644 $srcdir/usr/share/pixmaps/hqplayer4-client.png $pkgdir/usr/share/pixmaps/hqplayer4-client.png
install -Dm644 $srcdir/usr/share/doc/hqplayer4desktop/LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}
