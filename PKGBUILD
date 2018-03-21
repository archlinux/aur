#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.6.7
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6b579704accac726b588b0a4ae2448d49e2552735372084fcc0271754e62005f')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
