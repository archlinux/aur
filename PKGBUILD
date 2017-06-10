#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.4.6
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('cb0f5b8d1b4acc3dcc81160f54c0f040803ce4638e26d1aa2bd4b64003c4ab3d')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
