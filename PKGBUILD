#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.1.3
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('37f74ed9ef8cc5f4b59822cd1fe1a6a79a76d0468740fcb7050be9ee618471d8')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
