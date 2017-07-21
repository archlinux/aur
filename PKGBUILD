#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.1.8
pkgrel=2
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f6e97d5d5c8ba15ccbd8678243249be3a2a5f450964849625b51cb48cd7f6384')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
