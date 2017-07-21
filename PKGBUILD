#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.5.1
pkgrel=2
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('68c4cb9037abc2a5832826723b48e5d0d127f5689e9c2a72d5034dac1a079747')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
