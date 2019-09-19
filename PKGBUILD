#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.7.9
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9a38be03f3d874433b3888c4c4ac9647b9e50c1853d1a8e0ae2a42d4e5c394b1')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
