#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.2.8
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://sourceforge.net/projects/ffx264/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c2ee2469d4df9b0eb5901d3fa9e787876e4ae2a39ec0f8a8c8cf65c2bd44f74d')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
