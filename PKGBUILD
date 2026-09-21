#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=ffhevc
pkgver=4.7.13
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
sha256sums=('095d6b0da21673a2b31dacd211c8c136068e8c757d1d3db492fe8ed628d50931')

package() {
  cd $pkgname-$pkgver
  make install PREFIX="$pkgdir"/usr
}
