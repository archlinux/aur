#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.1.4
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6f4cd731e660e7b80421809ec29b007b514883f59e2ee19b5bcb4b8afb237551')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
