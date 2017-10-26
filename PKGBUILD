#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.5.4
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f17bd4de2ca62630fadb9333ea3fdf6b4b78be3aa19e873f1b72526751c56f78')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
