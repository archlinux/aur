#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.2.6
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1121f54c54dc3fcc46a4bdbf38bd34c8bf29cc92ccc916c7369a40c73bf202c4')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
