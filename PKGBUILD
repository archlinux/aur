#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=3.4.7
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.264 video format using ffmpeg and libx264.'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('511bf3439d92b81ec8f93a3d758202eb6fdd2fabed4025c555a0a4dd215f5853')

package()
{
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
