#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.8.3
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2ed8d85ba79d8f66f9230e9883f1ccc2d87d1a2ca147e78178881f394c8a005d')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
