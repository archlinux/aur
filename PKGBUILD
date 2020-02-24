#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.2.1
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1f0525cd7fd6f20b773053fc9b44cf7309ed1823858506b0c9be00cecb99ae30')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
