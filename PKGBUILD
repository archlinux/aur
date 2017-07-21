#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.1.8
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1f01b71f4c70abe2c4c6cfb9b4404fcb9eab19aef74d567b0dbe207770273d90')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
