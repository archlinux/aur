#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.6.8
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('78d609708105ed0cb9f9301f4fdeddee7197fcdbbea7a30a6f3588d045ecfa7f')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
