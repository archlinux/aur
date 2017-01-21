#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.3.2
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://sourceforge.net/projects/ffx264/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('013944df4d3d6f532ff24c3cbada5f62d9031b225d9df4b9e88068c13533bf4b')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
