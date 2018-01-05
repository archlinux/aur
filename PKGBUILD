#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.5.2
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ede31ee246ad815bfd11cf4a784d972bf6e0cae2d3abe5a6769b37a43ebcea4e')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
