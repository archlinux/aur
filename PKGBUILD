#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.4.3
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the MPEG4 Part 2/Xvid video format using ffmpeg.'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('42e1bdd4695e32f51cfb333d5dbae546f6b00fd514d02820053d6e9470b5b89f')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
