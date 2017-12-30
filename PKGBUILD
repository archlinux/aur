#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.5.6
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a28be1b96428b8c753b7cd0af0e91fb10d4e9c4a36ebf51177ff35b48d357aa5')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
