#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.6.9
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('67815d3a6ca38f8fdbb81f2fa5b2c8fd2d9b840ee8d33c4df3954a13e893304c')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
