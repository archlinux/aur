#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.5.3
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0eb0691d3a39f6d5cccf8720a278b4bcae8b63c32a6b5025bcf0c3eddd8cf73f')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
