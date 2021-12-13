# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer4
pkgver=4.15.0
_rpmpkgver=4.15.0-40
pkgrel=2
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'qt5-base' 'qt5-script' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack')
optdepends=('evince: hqplayer manual reading')
source=("https://www.signalyst.com/bins/hqplayer4desktop-"$_rpmpkgver".fc34.x86_64.rpm")
sha256sums=('d403fe8d3babd551562f788a9711557a6f11a48cf968d80abf5c4abcffeda017')

package() {
cd $srcdir
cp -R "$srcdir/usr" "$pkgdir"
install -Dm644 "$pkgdir/usr/share/doc/hqplayer4desktop/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
rm "$pkgdir/usr/share/doc/hqplayer4desktop/LICENSE"
}
