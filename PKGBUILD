#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=4.0.2
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3fe7f23e9d3a064dbce12c8fbcb48f79ebb7457c97bbf52e119e86195551c40a')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
