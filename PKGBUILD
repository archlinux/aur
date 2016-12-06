#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.0.6
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://sourceforge.net/projects/ffhevc/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('7eebcaa6a2c180b0516ce4156b2ab4865fb073e18d84e20ccde887a671b341aa')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
