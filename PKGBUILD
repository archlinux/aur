# Maintainer: MLM Games <gfxoxinzh@mozmail.com>
pkgname=vidshotter-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Fast CLI tool to extract equally-spaced screenshots from videos or GIFs using FFmpeg"
arch=('x86_64')
url="https://github.com/mlm-games/vidshotter"
license=('GPL-3.0-only')
depends=('ffmpeg')
provides=('vidshotter')
conflicts=('vidshotter')
source=("vidshotter-${pkgver}::https://github.com/mlm-games/vidshotter/releases/download/v${pkgver}/vidshotter-linux-x86_64")
sha256sums=('b2f59b52421feef1f349536cbedc27ac975eb73f79b88136076cf1539be7c50a')

package() {
  install -Dm755 "${srcdir}/vidshotter-${pkgver}" "${pkgdir}/usr/bin/vidshotter"
}
