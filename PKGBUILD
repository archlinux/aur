#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.2.6
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('60dbbe58f22be739a2ea32ade5dfc06c6170b3a8309777197dbc15a89d5dfa88')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
