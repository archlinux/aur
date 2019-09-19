#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.8.0
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a027308a25a9b6ac1ea88efebbaba39409a57163d5a2a0f4dd885eb7d97664db')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
