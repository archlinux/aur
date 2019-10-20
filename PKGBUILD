#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.9.2
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('bf8d3bf1f11a88ef3a240e0833f3831908080982e05c03c5f85b5454f94ff615')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
