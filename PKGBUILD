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
sha256sums=('8b50d98f43469f4e4ff2a81a4b2d394b2b364d9a6d4f17e58ee3b8e6dbaff32b')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
