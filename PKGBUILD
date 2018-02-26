#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.6.0
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('475615ce1fd4049bb3ad572e56e2393daae3703964397712fcdfa4672ae3e35a')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
