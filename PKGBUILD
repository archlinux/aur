# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer
_debpkgver=3.9.0-29_amd64
pkgver=3.9.0
pkgrel=1
pkgdesc="The high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/consumer.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'flac' 'libx11' 'gcc-libs' 'qt5-base' 'qt5-quick1' 'qt5-script') #qt5-quick1 
optdepends=('evince: hqplayer manual reading')
source=("http://www3.signalyst.com/bins/hqplayer_$_debpkgver.deb" 'copyright')
sha256sums=('9356ac18a9961ede2cf14ec996ef8c19f64c0be0fd0146379dc23f1b5ac97c81' '15fb909211ec2fef1f7fa9af779f22cb236031c1cdab213f9461fa5626f69965')

package() {
 cd "$srcdir"
  bsdtar xf data.tar.xz -C "$pkgdir"
   install -Dm644 "copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}