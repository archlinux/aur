#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.3.5
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://sourceforge.net/projects/ffx264/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3a60b5eb7b03dcd5288ebf36737b68e82810b6148ef3fe47957af3590c8e507f')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
