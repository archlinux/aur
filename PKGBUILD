# Maintainer: monsoon

pkgname=yttrim
pkgver=1.0
pkgrel=1
pkgdesc="Trim portions from online videos with ease."
arch=('any')
url="https://codeberg.org/theooo/yttrim"
source=("https://codeberg.org/theooo/yttrim/raw/branch/main/yttrim")
depends=("yt-dlp" "ffmpeg" "fzf")
license=("custom")
sha512sums=("SKIP")

package() {
  install -Dm755 yttrim "${pkgdir}/usr/bin/yttrim"
}
