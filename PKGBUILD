#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.2.4
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://sourceforge.net/projects/ffhevc/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2487a0eda8b8389f873386e4b7850a0d559d0af97fd1a6d350753664159cd998')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
