#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.1.2
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('35deb6fed71da3b11e25ec7a60d448f519a646914c3d7e76e3c8fbae9c36bed1')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
