#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.8.10
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
sha256sums=('10bc5046627395ec5d9b8679b159a3742e48c4d065f41531c326e3169656f86e')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
