#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.6.6
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('85b086d6fcdd2cb84b464e980aaf2a96646be274d4a436e25cd66e9b70f5fa1b')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
