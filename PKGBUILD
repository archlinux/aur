#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=4.0.5
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('359dd36b7200d7cd6ad14b9231aaadefe7eb89d8b092f30f4870519f2167121f')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
