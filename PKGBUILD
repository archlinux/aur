#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=4.2.7
pkgrel=1
pkgdesc='Small script to encode to H.264/AVC video using FFmpeg and libx264'
arch=(any)
url='https://ffx264.teambelgium.net/'
license=(GPL-2.0-or-later)
depends=(ffmpeg bc)
optdepends=(
  'mplayer: for crop preview'
  'gpac: for MP4 cover art'
)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3e9425746dd22654e54cdc4a20ae915e0e5c04f66c1ba531cce86d8288577392')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
