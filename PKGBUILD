#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.4.12
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
sha256sums=('36e4f7fbbd9bbdb6384d90921cfccf70dc0c31e02a9dc01bbcaa2791423f4c56')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
