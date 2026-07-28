#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffx264
pkgver=4.4.2
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
sha256sums=('f171da26652a5dbb276a3fcbef37c6233ced099393cba0a4beb751d2315f6063')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
