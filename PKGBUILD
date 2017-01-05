#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.0.8
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://sourceforge.net/projects/ffhevc/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a3db4bb4c57c3f6678699fd33ce7f1dc6e00665d445dc2d4d2454d2a3f6f655b')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
