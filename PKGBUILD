#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=3.7.7
pkgrel=1
pkgdesc='a small yet quite capable shell script for encoding video files to the H.265/HEVC video format using ffmpeg and libx265.'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL2)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('1e530b103bf41c8bd0acd97a2af2fe86c93620440d18e578f5f0a5998b0aafd4')

package() {
    cd $pkgname-$pkgver
    make install PREFIX="$pkgdir"/usr
}
