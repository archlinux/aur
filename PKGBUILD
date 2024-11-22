#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=4.2.10
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
sha256sums=('540ecbb82fbedea257805e432fb33b8892a30211c7d4b4d3e1a3430adcf2974d')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
