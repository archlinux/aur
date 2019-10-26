#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.9.7
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('7bf49eca2924fd24f3784a8f0665c7453a89ee7d0b6332eb97af8e76a4dcec5d')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
