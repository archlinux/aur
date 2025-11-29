#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.8.14
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
sha256sums=('665c017a0c76cada7810387f8c2c898b85112973a6875c6f99a93033e1274358')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
