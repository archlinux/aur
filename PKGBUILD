#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.2.7
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4efcdd57b111ff286e2eab42dcb3eefc82481e28b32331a9fc0152cc682e3da7')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
