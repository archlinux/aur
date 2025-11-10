#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.6.5
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
sha256sums=('1c45c2390a41dccb7ddb02a6cbea32330345676c4a30ad584bb5be4b85164959')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
