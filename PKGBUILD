#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.7.2
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg bc)
optdepends=(
    'mplayer: for crop preview only'
    'gpac: for mp4/mov cover art only'
)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('07ec734c0752ce751e014a4095c44d867a8e61b62439675de66340cb46fc51bb')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
