#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.2.3
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://sourceforge.net/projects/ffhevc/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('96cc6093def21f01dbff9eef975e4d38d62abfc4cc848f4e661e435d5dcccb55')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
