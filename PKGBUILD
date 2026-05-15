#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.7.2
pkgrel=1
pkgdesc='Small script to encode to H.265/HEVC video using FFmpeg and libx265'
arch=(any)
url='https://ffhevc.teambelgium.net/'
license=(GPL-2.0-or-later)
depends=(ffmpeg bc)
optdepends=(
  'mplayer: for crop preview'
  'gpac: for MP4 cover art'
)
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('eb4d44e9c24754d3eed6c136f38717e2733ee1f770dc2a1d19317352767a87e9')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
