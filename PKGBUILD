#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.6.0
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1b4a3494b510dd5b8f1af4332bdad70c9ac180a8e22c2e008179d9cd8fd71f24')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
