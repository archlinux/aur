#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.4.4
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('30f04fdfe0e7e5de8f1f29360b10ead8d90e8c973bb5a1b8a27c8157f9b4197d')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
