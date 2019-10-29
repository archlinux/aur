#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=4.0.1
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('baf13fad2793a965da4e36fd7af229ec7298ea30e4c1c197b2f9a9a6f6f270dd')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
