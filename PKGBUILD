#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.3.9
pkgrel=2
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('92a44057dd49d726bfdbca3439d690a2e5e82a85a8b7d40d8456158322467df5')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
