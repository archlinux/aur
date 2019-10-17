#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.8.8
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('e241453d94581c88a519be7a0b3f9f9a3cb5992dd1bb067bbff454dff094fc9b')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
