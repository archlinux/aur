#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.2.6
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://sourceforge.net/projects/ffx264/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1fee0357e91ed3fb0c9d8fe5ff29d745e73a348b7cb5548c040068b0953b2fee')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
