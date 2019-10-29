#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.5.9
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1c90b57a2b024bf9c43b833c5c6971ca8c2d98ca3eeecc7a692495e96f799273')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
