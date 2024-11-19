#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.8.9
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
sha256sums=('f3daa0b6be6a9b6a78cdd98f260b24f1b3057c9fcd8f2c7cbcc8b673fcdd716f')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
