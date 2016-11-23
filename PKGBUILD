#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.0.5
pkgrel=2
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://sourceforge.net/projects/ffhevc/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('14c0ebe1c16c9e0f1049484bfb3270645df95e1d6abd6590764fb91d4c409909')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"
}
