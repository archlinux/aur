#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.5.5
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f1ad5943d3337b0beafa832e7cf4e28165bcbc7c0e95fcdcd8d70f55432b6292')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
