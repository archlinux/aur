#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.4.8
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
sha256sums=('8c4b09f21239f7d2618e0255de6a5fc4cd6853e0a781b8d67c4379ee07040458')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
