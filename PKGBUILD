# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer
_debpkgver=3.7.1-24_amd64
pkgver=3.7.1
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'flac' 'libx11' 'gcc-libs' 'qt5-base' 'qt5-quick1' 'qt5-script') #qt5-quick1 
optdepends=('evince: hqplayer manual reading')
source=("http://www3.signalyst.com/bins/hqplayer_$_debpkgver.deb" 'copyright')
sha256sums=('1baf8e322c45e8fc29ae9a0f9bc965b4ffb54e7968320491f71c189e511b8e70' '15fb909211ec2fef1f7fa9af779f22cb236031c1cdab213f9461fa5626f69965')

package() {
 cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"
   install -Dm644 "copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}