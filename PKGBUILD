#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.1.7
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://sourceforge.net/projects/ffhevc/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('30d5f18e29490c86efda89448fa28d83009de79224af72d1c5b86cc9b4d70e85')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
