#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.9.2
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('29f6a2f2978022637cc2aaca7c8ef1fed3be99dc7d2cb8dca22e80b6dbbeff78')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
