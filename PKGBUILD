#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.4.9
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ab2dfeb32e46f9d53e57fb3230fd8ba297d400e03be3389894c6c8945b618220')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
