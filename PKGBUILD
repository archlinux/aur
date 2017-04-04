#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.3.8
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://sourceforge.net/projects/ffx264/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('d3443b087d09882a12345c65dded1375beb5a506ea6e8f3af56e498600d80758')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
