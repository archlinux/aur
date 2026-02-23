#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.6.19
pkgrel=1
pkgdesc='Small script to encode to H.265/HEVC video using FFmpeg and libx265'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL-2.0-or-later)
depends=(ffmpeg bc)
optdepends=(
  'mplayer: for crop preview'
  'gpac: for MP4 cover art'
)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f673ee60f060593f756380af865e1e3de1d00ebb41323aecb96947502c9481b9')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
