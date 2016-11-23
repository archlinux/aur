#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.2.1
pkgrel=2
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://sourceforge.net/projects/ffx264/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ef8d3bac8672cb0529fcef48851af449e45695f17b3e087f7c2b99bb4a6acca8')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"
}
