#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.2.1
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://sourceforge.net/projects/ffhevc/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2fecea58499cdf6274e9d7d7ce21dca63a6159ce55294f5be959363ebec77086')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
