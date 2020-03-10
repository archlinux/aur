#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.2.2
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f9e71b568683d269e51cd67d565fe42bec43ac77cf96d7f4bdb7541a5b4cf14f')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
