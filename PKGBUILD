#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=microenc
pkgver=3.2
pkgrel=2
pkgdesc='Small script to encode dir with audios to other formats using FFmpeg'
arch=(any)
url=' https://microenc.sourceforge.io/'
license=(GPL-2.0-or-later)
depends=(ffmpeg)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0b0a5592b07d2d6456ae1497d95e3628730ceda8d431248d7effd39cf4e0f604')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
