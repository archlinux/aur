# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer
_debpkgver=3.25.2-82
pkgver=3.25.2
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'flac' 'libx11' 'gcc-libs' 'qt5-base' 'qt5-script' 'qt5-quickcontrols')
optdepends=('evince: hqplayer manual reading')
source=("http://www.signalyst.com/bins/hqplayer_"$_debpkgver"_amd64.deb" 'copyright')
sha256sums=('SKIP' '15fb909211ec2fef1f7fa9af779f22cb236031c1cdab213f9461fa5626f69965')

package() {
 cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"
   install -Dm644 "copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
