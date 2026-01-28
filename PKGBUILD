#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=4.3.6
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
sha256sums=('a8e69ac12b9d0be3e919d90580d87fed77d5d733ac48337cea07c258445316b3')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
