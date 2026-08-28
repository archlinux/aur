#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.7.11
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
sha256sums=('2e9550fa7b1391965b5329b3754ae3604ef4b0c5d204e88e2a5e08a174694567')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
