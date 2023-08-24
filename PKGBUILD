#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=4.1.12
pkgrel=1
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
sha256sums=('fac0639ad8a70a1c74c62b3cad0437075ed42205fb68e110e745227f8fa8e5ad')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
