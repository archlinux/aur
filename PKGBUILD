#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffxvid
pkgver=1.9.0
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
sha256sums=('3d4b4b8badef7a571cd82dc9d979273f21ac4479f56632b4ff63e0dd9f8d4db7')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
