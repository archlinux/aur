# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer4
pkgver=4.10.3
_debpkgver=4.10.3-37
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('glibc' 'gcc-libs' 'libx11' 'qt5-base' 'qt5-script' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-declarative' 'qt5-graphicaleffects' 'qt5-charts' 'libmicrohttpd' 'alsa-lib' 'flac' 'wavpack')
optdepends=('evince: hqplayer manual reading')
source=("http://www.signalyst.eu/bins/hqplayer/focal/hqplayer4desktop_"$_debpkgver"_amd64.deb")
sha256sums=('65b022788893809dae49a6f1241e04330ee2d8be4f7a9ef44593370d32e2ff4c')

package() {
 cd $srcdir
 bsdtar xf data.tar.xz -C "$pkgdir"
 install -Dm644 "$pkgdir/usr/share/doc/hqplayer4desktop/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
 rm "$pkgdir/usr/share/doc/hqplayer4desktop/copyright"
}
