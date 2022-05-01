# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=aconcat
pkgver=0.1
pkgrel=1
pkgdesc="FFmpeg wrapper for concatenating audio files"
license=('MIT')
arch=('any')
md5sums=('SKIP')
makedepends=()
depends=(ffmpeg sed bash)
provides=(aconcat)
source=(aconcat.sh)

package () {
  install -Dm755 aconcat.sh "${pkgdir}/usr/bin/${pkgname}"
}
