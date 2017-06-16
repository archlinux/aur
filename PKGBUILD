#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.4.9
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('40f04d6d8bdd4fb6611ef02d095f8cc83f8c1ee403ecf055d0f0f5976d649d37')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
