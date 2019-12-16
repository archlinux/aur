#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.0.8
pkgrel=2
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4c2a957f1079e7d9b0ae2e00140ce666bc591ce06ad2c5960082e01bc6763722')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
