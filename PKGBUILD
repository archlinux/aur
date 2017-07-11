#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.5.0
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('79e7da9bdc504b95e6f890ddc75698b9b81f39ec80a173fd7b06c16e71ad1f36')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
