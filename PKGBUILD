# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer
_debpkgver=3.8.1-27_amd64
pkgver=3.8.1
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'flac' 'libx11' 'gcc-libs' 'qt5-base' 'qt5-quick1' 'qt5-script') #qt5-quick1 
optdepends=('evince: hqplayer manual reading')
source=("http://www3.signalyst.com/bins/hqplayer_$_debpkgver.deb" 'copyright')
sha256sums=('1bc079b7de4eb6d95a6525e66e0a4324d0c4ae123ae60cc2afd27a954c5a98a7' '15fb909211ec2fef1f7fa9af779f22cb236031c1cdab213f9461fa5626f69965')

package() {
 cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"
   install -Dm644 "copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}