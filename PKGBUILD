#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=4.0.9
pkgrel=2
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg bc)
optdepends=(
    'mplayer: for crop preview only'
    'gpac: for mp4/mov cover art only'
)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b192dcd6e156a80793bbc9416ee9051562d16ff8de56990401189eab8f66ce29')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
