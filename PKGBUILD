#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.2.0
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5b61f42b01e72e1b5cbd4c96d3774fcda084a6b0ebb749c94a2bfb6798277725')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
