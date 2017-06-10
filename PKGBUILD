#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.3.4
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('cfa260482e2dc754c2fe7abcc6a0da0ff68fd8ec7cffa0bf43029060e8663e7e')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
