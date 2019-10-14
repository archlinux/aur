#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.8.5
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0fbeb456cdf87608b440c64ad359b9fda2dfaeb76326ffc424eb776e6aeed0b3')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
