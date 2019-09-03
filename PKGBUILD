#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.3.2
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('87b4929e7d7c1b9d9a0e7bec0b6d87a2e579e789f65f2e6693fcd7704eb04715')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
