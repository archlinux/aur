#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.1.6
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ab32ccc6ee542ffc4f5d0d493ebf87e73cbc4a42fe260a89e3c1320508dc8ffa')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
