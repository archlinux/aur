#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.5.1
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg bc)
optdepends=(
    'mplayer: for crop preview only'
    'gpac: for mp4/mov cover art only'
)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0722b76a8b54a63cffa9a593b00648238832a167d2210ef5cfdb536d1a41392c')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
