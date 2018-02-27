#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.2.8
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('02cbad318ab14f51d909c78d0ff2c63ef7d2239c210cd43d1dfb1867c11655d8')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
