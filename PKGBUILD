#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.1.7
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2fc710000cf3d98628b2ea211354f6b5d1a0f87d308d2b0ecaf0c3bab4aa3183')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
