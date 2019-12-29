#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.6.2
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f33bcf3ba7f4c0655cfd5f90a094bb96d255b77bcf9c1e93a4a6b77b467ebafe')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
