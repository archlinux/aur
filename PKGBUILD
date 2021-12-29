# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer4
pkgver=4.15.2
_debpkgver=4.15.2-61
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'qt5-base' 'qt5-script' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack')
optdepends=('evince: hqplayer manual reading')
source=("https://www.signalyst.eu/bins/hqplayer/focal/hqplayer4desktop_"$_debpkgver"_amd64.deb")
sha256sums=('d4ad1c0f19c073b972bb5d527fa99adac905fefc8096b7a469395cedbc5f869f')

package() {
 cd $srcdir
 bsdtar xf data.tar.xz -C "$pkgdir"
 install -Dm644 "$pkgdir/usr/share/doc/hqplayer4desktop/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
 rm "$pkgdir/usr/share/doc/hqplayer4desktop/copyright"
}
