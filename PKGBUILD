#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.7.1
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('efc129ccb0decc930d912555b2ac4327829ad0bcd91156d3f2b8d4d709f25eb7')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
