#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.2.5
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://sourceforge.net/projects/ffx264/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('51018d4afd6711ebcd48a07c03fe88202bb8365512858e184a07c204d5fb77f4')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
