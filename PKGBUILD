#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.9.4
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('674d1d24cfe4a579f1f7c323738b87129ed4d4f97cf77a69fec0bc0a03b46ae1')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
