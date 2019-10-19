#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.9.1
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('613f3ab2dfc8a123f0353f1a726d09d8c485bbfc6b83b9002039960b0054b6b6')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
