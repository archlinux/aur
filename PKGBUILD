#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.2.5
pkgrel=2
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0d85396745d22f5d6e10121e84774e1993a3d307f83998df05f3cff5aa79534d')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
