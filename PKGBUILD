#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=4.2.4
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
sha256sums=('bf5ccf52be5d6eae2113d3e150657ab41440aee620338640bcc5145e743bbd0a')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
