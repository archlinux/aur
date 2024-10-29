#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.8.1
pkgrel=1
pkgdesc='Small script to encode to Xvid video using FFmpeg'
arch=(any)
url='https://ffxvid.teambelgium.net/'
license=(GPL-2.0-or-later)
depends=(ffmpeg bc)
optdepends=(
  'mplayer: for crop preview'
  'gpac: for MP4 cover art'
)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b90bd0500309f581c0161e23f77d67b373aa22c9219ddafc63aab6145a5297ab')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
