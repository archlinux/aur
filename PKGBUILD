#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.4.1
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('48e5289817099e3d486dfc11cc44c6e91498e57fc5ad714561a9eed5dd447e59')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
