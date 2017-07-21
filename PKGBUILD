#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.5.1
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6f64639f5a800d28552981be3f9e04eb1d26a111a6e691fd19a7af711598bfc7')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
