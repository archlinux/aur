#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.6.2
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('92d47d0f88e06eda1a55bbed1d64ea81166517e256263ee52dcd62f432162794')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
