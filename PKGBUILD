#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.1.9
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('db09bf6a2e8c79d13d91bfe3b277ffc5feecf21f1c8fb6013fa82735b12c710e')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
