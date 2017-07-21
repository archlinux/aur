#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.4.0
pkgrel=2
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('cfb3d7faba54f2815a6e214110f88e7eb386b5f0bff3adf7d7c99baa70189bc7')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
