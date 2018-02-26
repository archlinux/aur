#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.6.6
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('78086a48ffeb7b1b34a59e75ae35becffbf0873d47043db8154aa589b68a65ff')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
