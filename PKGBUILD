#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.2.3
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://sourceforge.net/projects/ffx264/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4427854a4dc79821fe4709abf6a9034b5f941538ff4d8ddfcd254d3a35fbe641')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
